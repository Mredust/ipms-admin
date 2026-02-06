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
        >新建投票</el-button>
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ipms:vote:export']"
        >投票结构导出</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="voteList">
      <el-table-column label="序号" align="center" type="index" width="60" />
      <el-table-column label="投票标题" align="center" prop="voteTitle" />
      <el-table-column label="投票说明" align="center" prop="remark" />
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
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ipms:vote:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ipms:vote:remove']"
          >删除</el-button>
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

    <!-- 添加或修改投票对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="投票标题" prop="voteTitle">
          <el-input v-model="form.voteTitle" placeholder="请输入投票标题" />
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
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listVote, getVote, delVote, addVote, updateVote } from "@/api/ipms/vote"

export default {
  name: "Vote",
  dicts: ['show_switch', 'vote_anonymous', 'vote_type'],
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
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        voteTitle: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        voteMode: [
          { required: true, message: "投票模式不能为空", trigger: "change" }
        ],
        showSwitch: [
          { required: true, message: "投票显示开关不能为空", trigger: "change" }
        ],
        anonymousSwitch: [
          { required: true, message: "投票匿名开关不能为空", trigger: "change" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询投票列表 */
    getList() {
      this.loading = true
      listVote(this.queryParams).then(response => {
        this.voteList = response.rows
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
        voteMode: null,
        showSwitch: 1,
        anonymousSwitch: 1,
        remark: null,
        createTime: null,
        updateTime: null
      }
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
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加投票"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getVote(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改投票"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateVote(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addVote(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除投票编号为"' + ids + '"的数据项？').then(function() {
        return delVote(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ipms/vote/export', {
        ...this.queryParams
      }, `vote_${new Date().getTime()}.xlsx`)
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
</style>
