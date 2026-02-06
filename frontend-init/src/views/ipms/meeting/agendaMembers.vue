<template>
  <div class="app-container agenda-members">
    <div class="page-header">
      <el-button size="mini" @click="goBack">返回</el-button>
      <span class="header-title">议题人员</span>
    </div>
    <div class="topic-info">议题名称:{{ topicName || '未命名' }}</div>

    <el-tabs v-model="memberTab">
      <el-tab-pane label="议程人员" name="selected">
        <el-table :data="selectedMembers" border size="small">
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
        </div>
        <el-table :data="availableUsers" border size="small">
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

export default {
  name: "AgendaMembers",
  data() {
    return {
      meetingId: null,
      topicKey: "",
      topicName: "",
      memberTab: "selected",
      userAll: [],
      userOptions: [],
      userSearchName: "",
      memberIds: []
    }
  },
  computed: {
    selectedMembers() {
      return this.userAll.filter(user => this.memberIds.includes(user.userId))
    },
    availableUsers() {
      const source = this.userOptions.length ? this.userOptions : this.userAll
      return source.filter(user => !this.memberIds.includes(user.userId))
    }
  },
  created() {
    this.meetingId = this.$route.params.meetingId
    this.topicKey = this.$route.query.topicKey || ""
    this.topicName = this.$route.query.topicName || ""
    this.loadUsers()
    this.loadMembers()
  },
  methods: {
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
    storageKey() {
      return `ipms_agenda_members_${this.meetingId}_${this.topicKey}`
    },
    loadMembers() {
      const raw = localStorage.getItem(this.storageKey())
      this.memberIds = raw ? JSON.parse(raw) : []
    },
    saveMembers() {
      localStorage.setItem(this.storageKey(), JSON.stringify(this.memberIds))
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
}

.member-search-input {
  width: 240px;
}
</style>
