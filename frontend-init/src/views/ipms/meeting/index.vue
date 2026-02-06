<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-row>
        <el-form-item label="所属范围" prop="deptId">
          <treeselect
            v-model="queryParams.deptId"
            :options="enabledDeptOptions"
            :show-count="true"
            placeholder="请选择所属范围"
            clearable
            class="treeselect-inline"
          />
        </el-form-item>
        <el-form-item label="会议名称" prop="meetingName">
          <el-input
            v-model="queryParams.meetingName"
            placeholder="请输入会议名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">刷新</el-button>
        </el-form-item>
      </el-row>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['ipms:meeting:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ipms:meeting:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ipms:meeting:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ipms:meeting:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="meetingList" @selection-change="handleSelectionChange">
      <el-table-column label="会议名称" align="center" prop="meetingName"/>
      <el-table-column label="开始时间" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="会议室" align="center" prop="roomId"/>
      <el-table-column label="会议主持人" align="center" prop="hostId"/>
      <el-table-column label="会议助理" align="center" prop="assistantId"/>
      <el-table-column label="会议类型" align="center" prop="typeId"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ipms:meeting:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ipms:meeting:remove']"
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

    <!-- 添加或修改会议对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="900px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row :gutter="22">
          <el-col :span="12">
            <el-form-item label="所属范围" prop="deptId">
              <treeselect
                v-model="form.deptId"
                :options="enabledDeptOptions"
                :show-count="true"
                placeholder="请选择所属范围"
                clearable
              />
            </el-form-item>
            <el-form-item label="会议名称" prop="meetingName">
              <el-input v-model="form.meetingName" placeholder="请输入会议名称"/>
            </el-form-item>
            <el-form-item label="副标题" prop="subtitle">
              <el-input v-model="form.subtitle" placeholder="请输入副标题"/>
            </el-form-item>
            <el-form-item label="开始时间" prop="startTime">
              <el-date-picker clearable
                              v-model="form.startTime"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="请选择开始时间">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="结束时间" prop="endTime">
              <el-date-picker clearable
                              v-model="form.endTime"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="请选择结束时间">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="选择会议室" prop="roomId">
              <el-select v-model="form.roomId" placeholder="请选择会议室" clearable>
                <el-option
                  v-for="item in meetingRoomOptions"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="会议主持人" prop="hostId">
              <el-input v-model="form.hostId" placeholder="请输入会议主持人"/>
            </el-form-item>
            <el-form-item label="会议助理" prop="assistantId">
              <el-input v-model="form.assistantId" placeholder="请输入会议助理"/>
            </el-form-item>
            <el-form-item label="会议类型" prop="typeId">
              <el-select v-model="form.typeId" placeholder="请选择会议类型" clearable>
                <el-option
                  v-for="item in meetingTypeOptions"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="功能选择" prop="featureSelect">
              <el-checkbox
                v-model="featureAll"
                :indeterminate="featureIndeterminate"
                @change="handleFeatureAllChange"
              >全选</el-checkbox>
              <el-checkbox-group v-model="form.featureSelect" @change="handleFeatureSelectChange">
                <el-checkbox
                  v-for="item in meetingFeatureOptions"
                  :key="item.id"
                  :label="item.id"
                >{{ item.featureName }}
                </el-checkbox>
              </el-checkbox-group>
            </el-form-item>

          </el-col>
          <el-col :span="12">
            <el-form-item label="会议Logo" prop="logo">
              <image-upload v-model="form.logo" :limit="1"/>
            </el-form-item>
            <el-form-item label="座位图" prop="seatChart">
              <image-upload v-model="form.seatChart" :limit="1"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  addMeeting,
  delMeeting,
  getMeeting,
  listMeeting,
  listMeetingFeature,
  listMeetingRoom,
  listMeetingType,
  updateMeeting
} from "@/api/ipms/meeting"
import {deptTreeSelect} from "@/api/system/user"
import Treeselect from "@riophae/vue-treeselect"
import "@riophae/vue-treeselect/dist/vue-treeselect.css"

export default {
  name: "Meeting",
  components: {Treeselect},
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
      // 会议表格数据
      meetingList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 部门树选项
      deptOptions: [],
      // 过滤禁用的部门选项
      enabledDeptOptions: [],
      // 会议类型选项
      meetingTypeOptions: [],
      // 会议室选项
      meetingRoomOptions: [],
      // 功能选项
      meetingFeatureOptions: [],
      // 功能选择全选
      featureAll: false,
      // 功能选择半选
      featureIndeterminate: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deptId: null,
        meetingName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        deptId: [
          {required: true, message: "所属范围不能为空", trigger: "change"}
        ],
        meetingName: [
          {required: true, message: "会议名称不能为空", trigger: "blur"}
        ],
        startTime: [
          {required: true, message: "开始时间不能为空", trigger: "blur"}
        ],
        endTime: [
          {required: true, message: "结束时间不能为空", trigger: "blur"}
        ],
        roomId: [
          {required: true, message: "选择会议室不能为空", trigger: "change"}
        ],
        hostId: [
          {required: true, message: "会议主持人不能为空", trigger: "blur"}
        ],
        typeId: [
          {required: true, message: "会议类型不能为空", trigger: "change"}
        ],
      }
    }
  },
  created() {
    this.getList()
    this.getDeptTree()
    this.getMeetingTypes()
    this.getMeetingRooms()
    this.getMeetingFeatures()
  },
  methods: {
    /** 查询会议列表 */
    getList() {
      this.loading = true
      const params = {
        ...this.queryParams,
        scope: this.queryParams.deptId
      }
      listMeeting(params).then(response => {
        this.meetingList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    /** 查询部门下拉树结构 */
    getDeptTree() {
      deptTreeSelect().then(response => {
        this.deptOptions = response.data
        this.enabledDeptOptions = this.filterDisabledDept(JSON.parse(JSON.stringify(response.data)))
      })
    },
    // 过滤禁用的部门
    filterDisabledDept(deptList) {
      return deptList.filter(dept => {
        if (dept.disabled) {
          return false
        }
        if (dept.children && dept.children.length) {
          dept.children = this.filterDisabledDept(dept.children)
        }
        return true
      })
    },
    /** 查询会议类型 */
    getMeetingTypes() {
      listMeetingType({pageNum: 1, pageSize: 10}).then(response => {
        this.meetingTypeOptions = response.rows || []
      })
    },
    /** 查询会议室 */
    getMeetingRooms() {
      listMeetingRoom({pageNum: 1, pageSize: 10}).then(response => {
        this.meetingRoomOptions = response.rows || []
      })
    },
    /** 查询会议功能 */
    getMeetingFeatures() {
      listMeetingFeature({pageNum: 1, pageSize: 20}).then(response => {
        this.meetingFeatureOptions = response.rows || []
        this.refreshFeatureSelectState()
      })
    },
    handleFeatureAllChange(val) {
      if (val) {
        this.form.featureSelect = this.meetingFeatureOptions.map(item => item.id)
      } else {
        this.form.featureSelect = []
      }
      this.featureIndeterminate = false
    },
    handleFeatureSelectChange(value) {
      const total = this.meetingFeatureOptions.length
      const checkedCount = value.length
      this.featureAll = total > 0 && checkedCount === total
      this.featureIndeterminate = checkedCount > 0 && checkedCount < total
    },
    refreshFeatureSelectState() {
      const selected = Array.isArray(this.form.featureSelect) ? this.form.featureSelect : []
      const total = this.meetingFeatureOptions.length
      const checkedCount = selected.length
      this.featureAll = total > 0 && checkedCount === total
      this.featureIndeterminate = checkedCount > 0 && checkedCount < total
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
        scope: null,
        deptId: null,
        meetingName: null,
        subtitle: null,
        startTime: null,
        endTime: null,
        roomId: null,
        hostId: null,
        assistantId: null,
        typeId: null,
        featureSelect: [],
        logo: null,
        seatChart: null,
        createTime: null,
        updateTime: null
      }
      this.featureAll = false
      this.featureIndeterminate = false
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
      this.queryParams.deptId = null
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
      this.title = "添加会议"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getMeeting(id).then(response => {
        this.form = response.data
        if (this.form.scope !== null && this.form.scope !== undefined && this.form.scope !== "") {
          const scopeNumber = Number(this.form.scope)
          this.form.deptId = Number.isNaN(scopeNumber) ? this.form.scope : scopeNumber
        } else {
          this.form.deptId = null
        }
        if (Array.isArray(this.form.featureSelect)) {
          this.form.featureSelect = this.form.featureSelect.map(item => Number(item))
        } else {
          this.form.featureSelect = this.form.featureSelect
            ? this.form.featureSelect.split(",").map(item => Number(item))
            : []
        }
        this.refreshFeatureSelectState()
        this.open = true
        this.title = "修改会议"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          const payload = {
            ...this.form,
            scope: this.form.deptId,
            featureSelect: Array.isArray(this.form.featureSelect)
              ? this.form.featureSelect.join(",")
              : this.form.featureSelect
          }
          delete payload.deptId
          if (this.form.id != null) {
            updateMeeting(payload).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addMeeting(payload).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除会议编号为"' + ids + '"的数据项？').then(function () {
        return delMeeting(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ipms/meeting/export', {
        ...this.queryParams
      }, `meeting_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>

<style scoped>
.treeselect-inline {
  display: inline-block;
  width: 200px;
  vertical-align: middle;
}
</style>
