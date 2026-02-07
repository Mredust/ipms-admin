<template>
  <div class="app-container agenda-members">
    <div class="page-header">
      <el-button size="mini" @click="goBack">返回</el-button>
      <span class="header-title">议题人员</span>
    </div>
    <div class="topic-info">议题名称：{{ topicName || '未命名' }}</div>

    <el-tabs v-model="memberTab">
      <el-tab-pane label="议程人员" name="selected">
        <div class="member-search">
          <el-input
            v-model="selectedSearchName"
            size="small"
            placeholder="按姓名搜索"
            class="member-search-input"
            clearable
            @keyup.enter.native="searchSelectedMembers"
          />
          <el-button size="small" type="primary" @click="searchSelectedMembers">搜索</el-button>
          <el-button size="small" @click="resetSelectedSearch">重置</el-button>
          <el-checkbox
            v-model="selectedAll"
            :indeterminate="selectedIndeterminate"
            @change="toggleSelectedAll"
          >全选</el-checkbox>
          <el-button
            size="small"
            type="danger"
            :disabled="selectedSelection.length === 0"
            @click="removeSelectedMembers"
          >移除已选</el-button>
        </div>
        <el-table
          ref="selectedTable"
          :data="filteredSelectedMembers"
          border
          size="small"
          row-key="userId"
          @selection-change="handleSelectedSelectionChange"
        >
          <el-table-column type="selection" width="55" />
          <el-table-column label="姓名" prop="nickName" />
          <el-table-column label="登录名" prop="userName" />
          <el-table-column label="部门" prop="dept.deptName" />
          <el-table-column label="操作" width="120" align="center">
            <template slot-scope="scope">
              <el-button size="mini" type="text" @click="removeMember(scope.row.userId)">移除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="选择议程参会人员" name="select">
        <div class="member-search">
          <el-input
            v-model="userSearchName"
            size="small"
            placeholder="按姓名搜索"
            class="member-search-input"
            clearable
            @keyup.enter.native="searchUsers"
          />
          <el-button size="small" type="primary" @click="searchUsers">搜索</el-button>
          <el-button size="small" @click="resetUserSearch">重置</el-button>
          <el-checkbox
            v-model="availableAll"
            :indeterminate="availableIndeterminate"
            @change="toggleAvailableAll"
          >全选</el-checkbox>
          <el-button
            size="small"
            type="primary"
            :disabled="availableSelection.length === 0"
            @click="addSelectedMembers"
          >添加已选</el-button>
        </div>
        <el-table
          ref="availableTable"
          :data="filteredAvailableUsers"
          border
          size="small"
          row-key="userId"
          @selection-change="handleAvailableSelectionChange"
        >
          <el-table-column type="selection" width="55" />
          <el-table-column label="姓名" prop="nickName" />
          <el-table-column label="登录名" prop="userName" />
          <el-table-column label="部门" prop="dept.deptName" />
          <el-table-column label="操作" width="120" align="center">
            <template slot-scope="scope">
              <el-button size="mini" type="text" @click="addMember(scope.row)">添加</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import { listUser } from "@/api/system/user"
import { getMeeting } from "@/api/ipms/meeting"
import { getAgenda, updateAgenda } from "@/api/ipms/agenda"

export default {
  name: "AgendaMembers",
  data() {
    return {
      meetingId: null,
      agendaId: null,
      topicNo: null,
      topicName: "",
      memberTab: "selected",
      userAll: [],
      userOptions: [],
      userSearchName: "",
      selectedSearchName: "",
      memberIds: [],
      agendaRows: [],
      agendaExtraColumns: [],
      selectedSelection: [],
      availableSelection: [],
      selectedAll: false,
      selectedIndeterminate: false,
      availableAll: false,
      availableIndeterminate: false
    }
  },
  computed: {
    selectedMembers() {
      return this.userAll.filter(user => this.memberIds.includes(user.userId))
    },
    filteredSelectedMembers() {
      if (!this.selectedSearchName) {
        return this.selectedMembers
      }
      return this.selectedMembers.filter(user => String(user.nickName || "").includes(this.selectedSearchName))
    },
    availableUsers() {
      const source = this.userOptions.length ? this.userOptions : this.userAll
      return source.filter(user => !this.memberIds.includes(user.userId))
    },
    filteredAvailableUsers() {
      if (!this.userSearchName) {
        return this.availableUsers
      }
      return this.availableUsers.filter(user => String(user.nickName || "").includes(this.userSearchName))
    }
  },
  watch: {
    filteredSelectedMembers() {
      this.syncSelectedState()
    },
    filteredAvailableUsers() {
      this.syncAvailableState()
    }
  },
  created() {
    this.meetingId = this.$route.params.meetingId
    this.agendaId = this.$route.query.agendaId || null
    this.topicNo = this.parseTopicNo(this.$route.query.topicNo)
    this.topicName = this.$route.query.topicName || ""
    this.loadUsers()
    this.initAgenda()
  },
  methods: {
    initAgenda() {
      if (this.agendaId) {
        this.loadAgenda()
        return
      }
      if (!this.meetingId) return
      getMeeting(this.meetingId).then(res => {
        const data = res.data || {}
        this.agendaId = data.agendaId || null
        this.loadAgenda()
      })
    },
    loadUsers() {
      listUser({ pageNum: 1, pageSize: 1000 }).then(res => {
        this.userAll = res.rows || []
        this.userOptions = this.userAll
      })
    },
    searchUsers() {
      if (!this.userSearchName) {
        this.userOptions = this.userAll
        return
      }
      listUser({ pageNum: 1, pageSize: 1000, nickName: this.userSearchName }).then(res => {
        this.userOptions = res.rows || []
      })
    },
    resetUserSearch() {
      this.userSearchName = ""
      this.userOptions = this.userAll
    },
    searchSelectedMembers() {
      // 搜索由 computed 过滤完成
    },
    resetSelectedSearch() {
      this.selectedSearchName = ""
    },
    handleSelectedSelectionChange(selection) {
      this.selectedSelection = selection || []
      this.syncSelectedState()
    },
    handleAvailableSelectionChange(selection) {
      this.availableSelection = selection || []
      this.syncAvailableState()
    },
    syncSelectedState() {
      const total = this.filteredSelectedMembers.length
      const checked = this.selectedSelection.length
      this.selectedAll = total > 0 && checked === total
      this.selectedIndeterminate = checked > 0 && checked < total
    },
    syncAvailableState() {
      const total = this.filteredAvailableUsers.length
      const checked = this.availableSelection.length
      this.availableAll = total > 0 && checked === total
      this.availableIndeterminate = checked > 0 && checked < total
    },
    toggleSelectedAll(val) {
      const table = this.$refs.selectedTable
      if (!table) return
      table.clearSelection()
      if (val) {
        this.filteredSelectedMembers.forEach(row => {
          table.toggleRowSelection(row, true)
        })
      }
    },
    toggleAvailableAll(val) {
      const table = this.$refs.availableTable
      if (!table) return
      table.clearSelection()
      if (val) {
        this.filteredAvailableUsers.forEach(row => {
          table.toggleRowSelection(row, true)
        })
      }
    },
    addMember(user) {
      if (!this.memberIds.includes(user.userId)) {
        this.memberIds.push(user.userId)
        this.saveMembers()
      }
    },
    removeMember(userId) {
      this.memberIds = this.memberIds.filter(id => id !== userId)
      this.saveMembers()
    },
    addSelectedMembers() {
      if (!this.availableSelection.length) return
      this.availableSelection.forEach(user => {
        if (!this.memberIds.includes(user.userId)) {
          this.memberIds.push(user.userId)
        }
      })
      this.saveMembers()
      this.availableSelection = []
      this.clearTableSelection("availableTable")
    },
    removeSelectedMembers() {
      if (!this.selectedSelection.length) return
      const ids = this.selectedSelection.map(user => user.userId)
      this.memberIds = this.memberIds.filter(id => !ids.includes(id))
      this.saveMembers()
      this.selectedSelection = []
      this.clearTableSelection("selectedTable")
    },
    clearTableSelection(refName) {
      const table = this.$refs[refName]
      if (table && table.clearSelection) {
        table.clearSelection()
      }
    },
    loadAgenda() {
      if (!this.agendaId) return
      getAgenda(this.agendaId).then(res => {
        const textJson = res.data ? res.data.textJson : "[]"
        const normalized = this.normalizeAgendaText(textJson)
        this.agendaExtraColumns = normalized.columns
        this.agendaRows = normalized.rows
        const row = this.findTopicRow()
        if (row) {
          this.memberIds = row.memberIds || []
          if (!this.topicName) {
            this.topicName = row.topicName || ""
          }
        } else {
          this.memberIds = []
        }
      })
    },
    findTopicRow() {
      if (!this.agendaRows.length) return null
      if (this.topicNo) {
        const found = this.agendaRows.find(item => Number(item.topicNo) === Number(this.topicNo))
        if (found) return found
      }
      return this.agendaRows[0]
    },
    saveMembers() {
      const row = this.findTopicRow()
      if (!row || !this.agendaId) return
      this.$set(row, "memberIds", Array.isArray(this.memberIds) ? this.memberIds : [])
      const payload = {
        id: this.agendaId,
        textJson: this.buildAgendaText()
      }
      updateAgenda(payload).then(() => {
        this.syncSelectedState()
        this.syncAvailableState()
      })
    },
    normalizeAgendaText(textJson) {
      let rowsRaw = []
      try {
        rowsRaw = textJson ? JSON.parse(textJson) : []
      } catch (e) {
        rowsRaw = []
      }
      let legacyColumns = []
      if (rowsRaw && !Array.isArray(rowsRaw) && typeof rowsRaw === "object") {
        legacyColumns = Array.isArray(rowsRaw.columns) ? rowsRaw.columns : []
        rowsRaw = Array.isArray(rowsRaw.rows) ? rowsRaw.rows : []
      }
      if (!Array.isArray(rowsRaw)) {
        rowsRaw = []
      }
      const columns = []
      const columnKeys = {}
      if (legacyColumns.length) {
        legacyColumns.forEach(col => {
          if (col && col.key && !columnKeys[col.key]) {
            columnKeys[col.key] = true
            columns.push({ key: col.key, label: col.label || col.key })
          }
        })
      }
      const rows = rowsRaw.map((item, index) => {
        const row = {
          key: item && item.key ? item.key : `row_${Date.now()}_${index}`,
          topicNo: this.getRowTopicNo(item, index),
          topicName: item && (item.topicName || item.topic || item.topicTitle) ? (item.topicName || item.topic || item.topicTitle) : "",
          mainFile: item && (item.mainFile || item.main_file) ? (item.mainFile || item.main_file) : "",
          mainFileName: item && (item.mainFileName || item.main_file_name) ? (item.mainFileName || item.main_file_name) : "",
          attachmentIds: this.parseIdList(item && (item.attachmentIds || item.attachment_ids)),
          memberIds: this.parseIdList(item && (item.memberIds || item.member_ids)),
          extra: {}
        }
        const extCol = item ? (item.ext_col || item.extCol) : null
        if (Array.isArray(extCol)) {
          extCol.forEach((col, colIndex) => {
            const key = col.key || col.label || `extra_${colIndex}`
            const label = col.label || col.key || `自定义列${colIndex + 1}`
            if (!columnKeys[key]) {
              columnKeys[key] = true
              columns.push({ key, label })
            }
            row.extra[key] = col.value !== undefined && col.value !== null ? col.value : ""
          })
        } else if (extCol && typeof extCol === "object") {
          Object.keys(extCol).forEach(key => {
            if (!columnKeys[key]) {
              columnKeys[key] = true
              columns.push({ key, label: key })
            }
            row.extra[key] = extCol[key]
          })
        } else if (item && item.extra && typeof item.extra === "object") {
          Object.keys(item.extra).forEach(key => {
            if (!columnKeys[key]) {
              columnKeys[key] = true
              columns.push({ key, label: key })
            }
            row.extra[key] = item.extra[key]
          })
        }
        return row
      })
      rows.forEach(row => {
        columns.forEach(col => {
          if (!Object.prototype.hasOwnProperty.call(row.extra, col.key)) {
            this.$set(row.extra, col.key, "")
          }
        })
      })
      return { columns, rows }
    },
    buildAgendaText() {
      const rows = this.agendaRows.map((row, index) => {
        const topicNo = index + 1
        this.$set(row, "topicNo", topicNo)
        const ext_col = this.agendaExtraColumns.map(col => ({
          key: col.key,
          label: col.label,
          value: row.extra ? row.extra[col.key] : ""
        }))
        return {
          topicNo,
          topicName: row.topicName || "",
          mainFile: row.mainFile || "",
          mainFileName: row.mainFileName || "",
          attachmentIds: Array.isArray(row.attachmentIds) ? row.attachmentIds : [],
          memberIds: Array.isArray(row.memberIds) ? row.memberIds : [],
          ext_col
        }
      })
      return JSON.stringify(rows)
    },
    parseIdList(value) {
      if (!value) return []
      if (Array.isArray(value)) {
        return value.map(item => Number(item)).filter(item => !Number.isNaN(item))
      }
      if (typeof value === "string") {
        try {
          const parsed = JSON.parse(value)
          if (Array.isArray(parsed)) {
            return parsed.map(item => Number(item)).filter(item => !Number.isNaN(item))
          }
        } catch (e) {
          // ignore
        }
        return value.split(/[,，]/).map(item => Number(item)).filter(item => !Number.isNaN(item))
      }
      if (typeof value === "number") {
        return [value]
      }
      return []
    },
    parseTopicNo(value) {
      const num = Number(value)
      return Number.isNaN(num) ? null : num
    },
    getRowTopicNo(item, index) {
      if (!item) return index + 1
      const num = Number(item.topicNo || item.topic)
      return Number.isNaN(num) ? index + 1 : num
    },
    goBack() {
      if (this.meetingId) {
        this.$router.push({ path: `/ipms/meeting/detail/${this.meetingId}` })
      } else {
        this.$router.back()
      }
    }
  }
}
</script>

<style scoped>
.page-header {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 12px;
}

.header-title {
  font-weight: 600;
  font-size: 16px;
}

.topic-info {
  margin-bottom: 16px;
  color: #606266;
}

.member-search {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 12px;
  flex-wrap: wrap;
}

.member-search-input {
  width: 240px;
}
</style>
