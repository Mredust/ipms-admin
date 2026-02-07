<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="投票标题" prop="voteTitle">
        <el-input
          v-model="queryParams.voteTitle"
          placeholder="请输入投票标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">刷新</el-button>
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['ipms:vote:add']"
        >新增投票
        </el-button>
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="exportVoteResults"
          v-hasPermi="['ipms:vote:export']"
        >投票结构导出
        </el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="voteList">
      <el-table-column label="序号" align="center" type="index" width="60"/>
      <el-table-column label="投票标题" align="center" prop="voteTitle"/>
      <el-table-column label="投票说明" align="center" prop="remark"/>
      <el-table-column label="匿名" align="center" prop="anonymousSwitch">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.vote_anonymous" :value="scope.row.anonymousSwitch"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="openVoteDetail(scope.row)"
          >详情
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ipms:vote:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ipms:vote:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <el-dialog :visible.sync="voteDetailVisible" :title="voteDetailTitle" width="820px" append-to-body>
      <div class="vote-detail-title">{{ voteDetailTitle }}</div>
      <el-table :data="voteDetailRows" border size="small">
        <el-table-column label="序号" type="index" width="60" align="center"/>
        <el-table-column label="选项内容" prop="optionName" min-width="160"/>
        <el-table-column label="已选" prop="count" width="80" align="center"/>
        <el-table-column label="已投票人员姓名" prop="voters" min-width="240"/>
        <el-table-column label="百分比" prop="percent" width="100" align="center"/>
      </el-table>
    </el-dialog>

    <!-- 新增或修改投票对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="投票标题" prop="voteTitle">
          <el-input v-model="form.voteTitle" placeholder="请输入投票标题"/>
        </el-form-item>
        <el-form-item label="投票模式" prop="voteMode">
          <el-select v-model="form.voteMode" placeholder="请选择投票模式">
            <el-option
              v-for="dict in dict.type.vote_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
          <div class="form-tip">模式一：赞成，反对，弃权；模式二：赞成，反对</div>
        </el-form-item>
        <el-form-item v-if="isCustomMode" label="投票项">
          <div class="custom-options">
            <div v-for="(item, index) in optionItems" :key="index" class="custom-option-row">
              <el-input v-model="item.name" placeholder="请输入投票项" class="custom-option-input"/>
              <el-button size="mini" type="danger" @click="removeOption(index)">移除</el-button>
            </div>
            <el-button size="mini" type="primary" @click="addOption">添加</el-button>
          </div>
        </el-form-item>
        <el-form-item label="投票显示开关" prop="showSwitch">
          <el-select v-model="form.showSwitch" placeholder="请选择投票显示开关">
            <el-option
              v-for="dict in dict.type.show_switch"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
          <div class="form-tip">“是”投票项为打开状态；“否”投票项未打开，需要主持人手动开启</div>
        </el-form-item>
        <el-form-item label="投票匿名开关" prop="anonymousSwitch">
          <el-select v-model="form.anonymousSwitch" placeholder="请选择投票匿名开关">
            <el-option
              v-for="dict in dict.type.vote_anonymous"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
          <div class="form-tip">“是”开启匿名投票；“否”开始实名投票</div>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确定</el-button>
        <el-button @click="cancel">取消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {addVote, delVote, getVote, listVote, updateVote} from "@/api/ipms/vote"
import {getMeeting} from "@/api/ipms/meeting"
import * as XLSX from "xlsx"

export default {
  name: "Vote",
  dicts: ['show_switch', 'vote_anonymous', 'vote_type'],
  props: {
    meetingId: {
      type: [String, Number],
      default: null
    },
    meetingName: {
      type: String,
      default: ""
    },
    voteIds: {
      type: [String, Array],
      default: null
    }
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 投票表格数据
      voteList: [],
      optionItems: [],
      voteIdList: [],
      voteDetailVisible: false,
      voteDetailTitle: "",
      voteDetailRows: [],
      voteDetailRecords: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        voteTitle: null,
        meetingId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        voteTitle: [
          {required: true, message: "投票主题不能为空", trigger: "change"}
        ], voteMode: [
          {required: true, message: "投票模式不能为空", trigger: "change"}
        ],
        showSwitch: [
          {required: true, message: "投票显示开关不能为空", trigger: "change"}
        ],
        anonymousSwitch: [
          {required: true, message: "投票匿名开关不能为空", trigger: "change"}
        ],
      }
    }
  },
  computed: {
    currentMeetingId() {
      if (this.meetingId) {
        return this.meetingId
      }
      const query = (this.$route && this.$route.query) ? this.$route.query : {}
      return query.meetingId || query.id || null
    },
    currentMeetingName() {
      if (this.meetingName) {
        return this.meetingName
      }
      const query = (this.$route && this.$route.query) ? this.$route.query : {}
      return query.meetingName || ""
    },
    currentVoteIds() {
      const fromList = this.normalizeVoteIds(this.voteIdList)
      if (fromList.length) {
        return fromList
      }
      if (this.voteIds !== null && this.voteIds !== undefined && this.voteIds !== "") {
        return this.normalizeVoteIds(this.voteIds)
      }
      return []
    },
    isCustomMode() {
      return this.isCustomVoteMode(this.form.voteMode)
    }
  },
  watch: {
    voteIds(val) {
      if (val === null || val === undefined) return
      this.voteIdList = this.normalizeVoteIds(val)
      this.getList()
    },
    "form.voteMode"() {
      if (this.isCustomMode) {
        if (!this.optionItems.length) {
          this.addOption()
        }
      } else {
        this.optionItems = []
      }
    }
  },
  created() {
    if (this.currentMeetingId) {
      this.queryParams.meetingId = this.currentMeetingId
    }
    this.initVoteScope().then(() => {
      this.getList()
    })
  },
  methods: {
    initVoteScope() {
      if (this.voteIds !== null && this.voteIds !== undefined && this.voteIds !== "") {
        this.voteIdList = this.normalizeVoteIds(this.voteIds)
        return Promise.resolve()
      }
      if (this.currentMeetingId) {
        return this.refreshVoteIds(false)
      }
      return Promise.resolve()
    },
    refreshVoteIds(shouldReload = true) {
      if (!this.currentMeetingId) return Promise.resolve()
      return getMeeting(this.currentMeetingId).then(res => {
        const data = res.data || {}
        this.voteIdList = this.normalizeVoteIds(data.voteIds)
        if (shouldReload) {
          this.getList()
        }
      })
    },
    normalizeVoteIds(source) {
      if (!source) return []
      if (Array.isArray(source)) {
        return source.map(item => String(item))
      }
      if (typeof source === "string") {
        try {
          const parsed = JSON.parse(source)
          if (Array.isArray(parsed)) {
            return parsed.map(item => String(item))
          }
        } catch (e) {
          // ignore
        }
        return source.split(/[,，]/).map(item => item.trim()).filter(item => item)
      }
      return [String(source)]
    },
    addOption() {
      this.optionItems.push({name: ""})
    },
    removeOption(index) {
      this.optionItems.splice(index, 1)
    },
    isCustomVoteMode(mode) {
      const value = String(mode || "")
      return value === "3" || value.toLowerCase() === "custom" || value.includes("自定义")
    },
    isModeOne(mode) {
      const value = String(mode || "")
      return value === "1" || value.toLowerCase() === "mode1" || value.includes("模式一")
    },
    isModeTwo(mode) {
      const value = String(mode || "")
      return value === "2" || value.toLowerCase() === "mode2" || value.includes("模式二")
    },
    buildVoteRes() {
      const mode = this.form.voteMode
      if (this.isModeOne(mode)) {
        return JSON.stringify({"赞成": 0, "反对": 0, "弃权": 0})
      }
      if (this.isModeTwo(mode)) {
        return JSON.stringify({"赞成": 0, "反对": 0})
      }
      if (this.isCustomVoteMode(mode)) {
        const options = this.optionItems
          .map(item => String(item.name || "").trim())
          .filter(item => item)
        const unique = Array.from(new Set(options))
        if (!unique.length) {
          return null
        }
        const payload = {}
        unique.forEach(name => {
          payload[name] = 0
        })
        return JSON.stringify(payload)
      }
      return this.form.voteRes || "{}"
    },
    parseVoteResOptions(voteRes) {
      if (!voteRes) return []
      try {
        const data = JSON.parse(voteRes)
        if (Array.isArray(data)) {
          return data.map(item => String(item))
        }
        if (data && typeof data === "object") {
          return Object.keys(data)
        }
      } catch (e) {
        // ignore
      }
      return []
    },
    /** 查询投票列表 */
    getList() {
      this.loading = true
      listVote(this.queryParams).then(response => {
        const rows = response.rows || []
        const voteIds = this.currentVoteIds
        const hasVoteScope = (this.voteIds !== null && this.voteIds !== undefined) || this.voteIdList.length
        if (hasVoteScope) {
          this.voteList = voteIds.length ? rows.filter(row => voteIds.includes(String(row.id))) : []
        } else if (this.currentMeetingId) {
          this.voteList = rows.filter(row => String(row.meetingId) === String(this.currentMeetingId))
        } else {
          this.voteList = rows
        }
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        voteTitle: null,
        agendaId: null,
        meetingId: this.currentMeetingId,
        voteMode: null,
        voteRes: null,
        showSwitch: 1,
        anonymousSwitch: 1,
        remark: null,
        createTime: null,
        updateTime: null
      }
      this.optionItems = []
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.queryParams.meetingId = this.currentMeetingId
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "新增投票"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getVote(id).then(response => {
        this.form = response.data

        this.optionItems = []
        if (this.isCustomVoteMode(this.form.voteMode)) {
          const options = this.parseVoteResOptions(this.form.voteRes)
          this.optionItems = options.map(name => ({name}))
          if (!this.optionItems.length) {
            this.addOption()
          }
        }
        this.open = true
        this.title = "修改投票"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.currentMeetingId) {
            this.form.meetingId = this.currentMeetingId
          }
          const voteRes = this.buildVoteRes()
          if (this.isCustomVoteMode(this.form.voteMode) && !voteRes) {
            this.$modal.msgError("请填写至少一个投票项")
            return
          }
          this.form.voteRes = voteRes
          if (this.form.id != null) {
            updateVote(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.refreshVoteIds()
            })
          } else {
            addVote(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.refreshVoteIds()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm("是否确认删除投票编号为" + ids + "的数据项？").then(function () {
        return delVote(ids)
      }).then(() => {
        this.refreshVoteIds()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {
      })
    },
    openVoteDetail(vote) {
      if (Number(vote.anonymousSwitch) === 1) {
        this.$alert("该投票项为匿名投票，不能查看投票详情", "提示", {
          confirmButtonText: "确定"
        })
        return
      }
      const detail = this.normalizeVoteResults(vote)
      const rows = detail.options.map((option, index) => {
        const count = detail.counts[option] || 0
        const voters = detail.votersMap[option] || []
        const percent = detail.total > 0 ? `${(count / detail.total * 100).toFixed(2)}%` : "0.00%"
        return {
          index: index + 1,
          optionName: option,
          count,
          voters: voters.join("，"),
          percent
        }
      })
      this.voteDetailTitle = vote.voteTitle || "投票详情"
      this.voteDetailRows = rows
      this.voteDetailRecords = detail.records
      this.voteDetailVisible = true
    },
    exportVoteResults() {
      if (!this.voteList.length) {
        this.$modal.msgWarning("暂无投票数据")
        return
      }
      const meetingName = this.currentMeetingName || "会议"
      const wb = XLSX.utils.book_new()
      const summaryRows = []
      summaryRows.push([`${meetingName} - 投票表`])
      summaryRows.push(["序号", "投票标题", "选项结果"])
      this.voteList.forEach((vote, idx) => {
        const detail = this.normalizeVoteResults(vote)
        const optionText = detail.options.map(option => {
          const count = detail.counts[option] || 0
          const percent = detail.total > 0 ? `${(count / detail.total * 100).toFixed(2)}%` : "0.00%"
          return `${option}${count}票(${percent})`
        }).join("，")
        summaryRows.push([idx + 1, vote.voteTitle || `投票${idx + 1}`, optionText])
      })
      const summarySheet = XLSX.utils.aoa_to_sheet(summaryRows)
      summarySheet["!merges"] = [{s: {r: 0, c: 0}, e: {r: 0, c: 2}}]
      XLSX.utils.book_append_sheet(wb, summarySheet, "投票表")

      this.voteList.forEach((vote, idx) => {
        const detail = this.normalizeVoteResults(vote)
        const rows = []
        rows.push([`${meetingName} - ${vote.voteTitle || "投票"}`])
        rows.push(["序号", "投票人", "投票结果", "投票时间", "签名"])
        detail.records.forEach((record, recordIndex) => {
          rows.push([
            recordIndex + 1,
            this.getRecordUserName(record),
            this.getRecordOptionName(record),
            this.getRecordTime(record),
            this.getRecordSign(record)
          ])
        })
        const sheet = XLSX.utils.aoa_to_sheet(rows)
        sheet["!merges"] = [{s: {r: 0, c: 0}, e: {r: 0, c: 4}}]
        XLSX.utils.book_append_sheet(wb, sheet, `sheet${idx + 1}`)
      })
      XLSX.writeFile(wb, `vote_${new Date().getTime()}.xlsx`)
    },
    normalizeVoteResults(vote) {
      const options = this.getVoteOptions(vote)
      const counts = {}
      const votersMap = {}
      const resultList = this.getOptionResults(vote)
      resultList.forEach(item => {
        const name = item.name
        if (!name) return
        counts[name] = item.count || 0
        if (item.users && item.users.length) {
          votersMap[name] = item.users.slice()
        }
      })
      const records = this.getVoteRecords(vote)
      if (records.length) {
        Object.keys(counts).forEach(key => delete counts[key])
        Object.keys(votersMap).forEach(key => delete votersMap[key])
      }
      records.forEach(record => {
        const name = this.getRecordOptionName(record)
        if (!name) return
        counts[name] = (counts[name] || 0) + 1
        const voter = this.getRecordUserName(record)
        if (voter) {
          if (!votersMap[name]) votersMap[name] = []
          if (!votersMap[name].includes(voter)) {
            votersMap[name].push(voter)
          }
        }
      })
      Object.keys(counts).forEach(name => {
        if (!options.includes(name)) {
          options.push(name)
        }
      })
      options.forEach(option => {
        if (counts[option] === undefined) counts[option] = 0
        if (!votersMap[option]) votersMap[option] = []
      })
      const total = records.length || Object.values(counts).reduce((sum, val) => sum + val, 0)
      return {options, counts, total, votersMap, records}
    },
    getVoteOptions(vote) {
      const mode = String(vote.voteMode || "")
      if (mode === "1" || mode.includes("模式一")) {
        return ["赞成", "反对", "弃权"]
      }
      if (mode === "2" || mode.includes("模式二")) {
        return ["赞成", "反对"]
      }
      const resOptions = this.parseVoteResOptions(vote.voteRes)
      if (resOptions.length) {
        return resOptions
      }
      const candidates = [
        vote.optionList,
        vote.options,
        vote.optionNames,
        vote.customOptions
      ]
      for (const item of candidates) {
        if (Array.isArray(item)) {
          return item.map(opt => opt.name || opt.label || opt.optionName || opt.value || opt)
        }
        if (typeof item === "string" && item.trim()) {
          return item.split(/[,，]/).map(opt => opt.trim()).filter(Boolean)
        }
      }
      return ["赞成", "反对", "弃权"]
    },
    getOptionResults(vote) {
      const candidates = [
        vote.optionResults,
        vote.resultList,
        vote.voteResultList,
        vote.optionResultList,
        vote.results
      ]
      const list = candidates.find(item => Array.isArray(item)) || []
      return list.map(item => {
        const name = item.optionName || item.name || item.option || item.label
        let users = item.users || item.userList || item.voters || []
        const rawCount = item.count ?? item.total ?? item.voteCount ?? item.num
        if (typeof users === "string") {
          users = users.split(/[,，]/).map(val => val.trim()).filter(Boolean)
        }
        if (Array.isArray(users)) {
          users = users.map(user => {
            if (typeof user === "string") return user
            if (!user) return ""
            return user.nickName || user.userName || user.name || ""
          }).filter(Boolean)
        }
        const count = rawCount !== null && rawCount !== undefined ? Number(rawCount) : (Array.isArray(users) ? users.length : 0)
        return {name, count, users}
      }).filter(item => item.name)
    },
    getVoteRecords(vote) {
      const candidates = [
        vote.records,
        vote.recordList,
        vote.voteRecords,
        vote.detailList,
        vote.record
      ]
      const list = candidates.find(item => Array.isArray(item))
      return list || []
    },
    getRecordOptionName(record) {
      return record.optionName || record.option || record.voteOption || record.result || record.voteResult || record.choice || ""
    },
    getRecordUserName(record) {
      return record.nickName || record.userName || record.user || record.voterName || record.name || ""
    },
    getRecordTime(record) {
      return record.voteTime || record.createTime || record.time || ""
    },
    getRecordSign(record) {
      return record.sign || record.signature || ""
    }
  }
}
</script>

<style scoped>
.form-tip {
  margin-top: 6px;
  color: #9e9e9e;
  font-size: 13px;
  line-height: 1.4;
}

.vote-detail-title {
  font-weight: 600;
  margin-bottom: 10px;
}

.custom-options {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.custom-option-row {
  display: flex;
  align-items: center;
  gap: 8px;
}

.custom-option-input {
  flex: 1;
}
</style>





























