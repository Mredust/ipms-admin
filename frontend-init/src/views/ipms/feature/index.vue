<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item>
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['ipms:feature:add']"
        >新增会议功能
        </el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">刷新</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="featureList" @selection-change="handleSelectionChange">
      <el-table-column label="功能名称" align="center" prop="featureName"/>
      <el-table-column label="功能别名" align="center" prop="featureAlias"/>
      <el-table-column label="颜色选择" align="center" prop="color"/>
      <el-table-column label="排序" align="center" prop="sortOrder"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ipms:feature:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ipms:feature:remove']"
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

    <!-- 添加或修改会议功能对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="功能名称" prop="featureName">
          <el-input v-model="form.featureName" placeholder="请输入功能名称"/>
        </el-form-item>
        <el-form-item label="功能别名" prop="featureAlias">
          <el-input v-model="form.featureAlias" placeholder="请输入功能别名"/>
        </el-form-item>
        <el-form-item label="排序" prop="sortOrder">
          <el-input v-model="form.sortOrder" placeholder="请输入排序"/>
        </el-form-item>
        <el-form-item label="颜色选择" prop="color">
          <el-color-picker
            v-model="form.color"
            color-format="hex"
            @change="handleColorChange"
          />
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
import {addFeature, delFeature, getFeature, listFeature, updateFeature} from "@/api/ipms/feature"

export default {
  name: "Feature",
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
      // 会议功能表格数据
      featureList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 20,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {}
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询会议功能列表 */
    getList() {
      this.loading = true
      listFeature(this.queryParams).then(response => {
        const rows = response.rows || []
        this.featureList = rows.sort((a, b) => {
          const aVal = Number(a && a.sortOrder != null ? a.sortOrder : Number.POSITIVE_INFINITY)
          const bVal = Number(b && b.sortOrder != null ? b.sortOrder : Number.POSITIVE_INFINITY)
          return aVal - bVal
        })
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
        featureName: null,
        featureAlias: null,
        sortOrder: null,
        color: null,
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
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.form.color = '#FFFFFF'
      this.open = true
      this.title = "添加会议功能"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getFeature(id).then(response => {
        this.form = response.data
        this.form.color = this.normalizeHexColor(this.form.color)
        this.open = true
        this.title = "修改会议功能"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.color = this.normalizeHexColor(this.form.color)
          if (this.form.id != null) {
            updateFeature(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addFeature(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除会议功能编号为"' + ids + '"的数据项？').then(function () {
        return delFeature(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ipms/feature/export', {
        ...this.queryParams
      }, `feature_${new Date().getTime()}.xlsx`)
    },
    handleColorChange(color) {
      this.form.color = this.normalizeHexColor(color)
    },
    normalizeHexColor(color) {
      if (!color) {
        return color
      }
      const hexMatch = color.match(/^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$/)
      if (hexMatch) {
        const raw = hexMatch[1]
        const full = raw.length === 3
          ? raw.split("").map(ch => ch + ch).join("")
          : raw
        return `#${full.toUpperCase()}`
      }
      const rgbMatch = color.match(/^rgba?\(([^)]+)\)$/i)
      if (rgbMatch) {
        const parts = rgbMatch[1].split(",").map(item => item.trim())
        const r = Math.max(0, Math.min(255, parseInt(parts[0], 10)))
        const g = Math.max(0, Math.min(255, parseInt(parts[1], 10)))
        const b = Math.max(0, Math.min(255, parseInt(parts[2], 10)))
        const toHex = (v) => v.toString(16).padStart(2, "0").toUpperCase()
        return `#${toHex(r)}${toHex(g)}${toHex(b)}`
      }
      return color
    }
  }
}
</script>
