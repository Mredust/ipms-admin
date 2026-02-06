<template>
  <div class="app-container meeting-detail">
    <el-tabs v-model="activeTab">
      <el-tab-pane label="会议信息" name="info">
        <div class="info-actions">
          <div class="action-row">
            <div class="action-left">
              <el-button type="primary" size="mini" @click="openEditDialog">修改会议信息</el-button>
              <el-button size="mini" @click="skinDialogVisible = true">更换皮肤</el-button>
              <el-button size="mini" @click="sloganDialogVisible = true">会议标语</el-button>
              <el-button size="mini" @click="backscreenDialogVisible = true">背屏设置</el-button>
            </div>
          </div>
          <el-row class="action-row" :gutter="12">
            <el-col :span="12">
              <div class="action-left">
                <el-button
                  type="warning"
                  size="mini"
                  v-if="meetingStatus === statusMap.unpublished"
                  @click="publishMeeting"
                >发布会议</el-button>
                <el-button
                  type="warning"
                  size="mini"
                  v-else-if="meetingStatus === statusMap.ended"
                  @click="cancelPublishMeeting"
                >取消发布会议</el-button>
              </div>
            </el-col>
            <el-col :span="12">
              <div class="action-right">
                <el-button
                  type="success"
                  size="mini"
                  v-if="meetingStatus === statusMap.ended"
                  @click="openMeeting"
                >开启会议</el-button>
                <el-button
                  type="danger"
                  size="mini"
                  v-if="meetingStatus === statusMap.inProgress"
                  @click="closeMeeting"
                >关闭会议</el-button>
                <el-button
                  type="info"
                  size="mini"
                  v-if="meetingStatus === statusMap.inProgress"
                  @click="packOpinions"
                >一键打包</el-button>
                <el-button size="mini" @click="downloadAgendaFile">下载议程文件</el-button>
              </div>
            </el-col>
          </el-row>
        </div>

        <div class="info-center">
          <el-card class="info-card" shadow="never">
            <div class="info-title">{{ meeting.meetingName || "会议" }}</div>
            <div class="info-list">
              <div class="info-item">
                <span class="info-label">会议时间：</span>
                <span class="info-value">{{ meetingTimeText }}</span>
              </div>
              <div class="info-item">
                <span class="info-label">会议主持人：</span>
                <span class="info-value">{{ getUserName(meeting.hostId) }}</span>
              </div>
              <div class="info-item">
                <span class="info-label">会议助理：</span>
                <span class="info-value">{{ getUserName(meeting.assistantId) }}</span>
              </div>
              <div class="info-item">
                <span class="info-label">会议室：</span>
                <span class="info-value">{{ getRoomName(meeting.roomId) }}</span>
              </div>
              <div class="info-item">
                <span class="info-label">会议类型：</span>
                <span class="info-value">{{ getTypeName(meeting.typeId) }}</span>
              </div>
              <div class="info-item">
                <span class="info-label">参会人员：</span>
                <span class="info-value">{{ memberNamesText || "暂无" }}</span>
              </div>
              <div class="info-item">
                <span class="info-label">欢迎语：</span>
                <span class="info-value">{{ slogan.welcomeText || "欢迎您莅临此次会议" }}</span>
              </div>
            </div>
          </el-card>
        </div>
      </el-tab-pane>

      <el-tab-pane label="参会人员" name="members">
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
      </el-tab-pane>

      <el-tab-pane label="会议议程" name="agenda">
        <div class="agenda-toolbar">
          <div class="toolbar-right">
            <el-button size="mini" @click="addAgendaColumn">添加列</el-button>
            <el-button size="mini" @click="removeAgendaColumn" :disabled="agendaExtraColumns.length === 0">删除列</el-button>
          </div>
        </div>
        <el-table :data="agendaRows" border size="small">
          <el-table-column label="议题" width="80" align="center">
            <template slot-scope="scope">
              {{ scope.$index + 1 }}
            </template>
          </el-table-column>
          <el-table-column label="议题名称" min-width="200">
            <template slot-scope="scope">
              <el-input v-model="scope.row.topicName" size="small" @input="markAgendaDirty" />
            </template>
          </el-table-column>
          <el-table-column label="主文件" min-width="200">
            <template slot-scope="scope">
              <el-upload
                :action="uploadUrl"
                :headers="uploadHeaders"
                :show-file-list="false"
                :before-upload="(file) => beforeAgendaFileUpload(file, scope.row)"
                :on-success="(res, file) => handleAgendaFileSuccess(res, file, scope.row)"
              >
                <el-button size="mini">上传</el-button>
              </el-upload>
              <el-link
                v-if="scope.row.mainFile"
                :href="fileFullUrl(scope.row.mainFile)"
                target="_blank"
                class="agenda-file-link"
              >{{ scope.row.mainFileName || '查看文件' }}</el-link>
            </template>
          </el-table-column>
          <el-table-column label="附件" min-width="140">
            <template slot-scope="scope">
              <el-button size="mini" type="text" @click="openMaterial(scope.row)">会议资料</el-button>
            </template>
          </el-table-column>
          <el-table-column label="议题人员" min-width="160">
            <template slot-scope="scope">
              <el-button size="mini" type="text" @click="openAgendaMembers(scope.row)">选择人员</el-button>
              <span v-if="getAgendaMemberCount(scope.row) > 0" class="member-count">
                已选{{ getAgendaMemberCount(scope.row) }}人
              </span>
            </template>
          </el-table-column>
          <el-table-column
            v-for="col in agendaExtraColumns"
            :key="col.key"
            min-width="160"
          >
            <template slot="header">
              <el-input
                v-model="col.label"
                size="mini"
                placeholder="列标题"
                @input="markAgendaDirty"
              />
            </template>
            <template slot-scope="scope">
              <el-input v-model="scope.row.extra[col.key]" size="small" @input="markAgendaDirty" />
            </template>
          </el-table-column>
        </el-table>
        <div class="agenda-footer">
          <div class="toolbar-right">
            <el-button size="mini" @click="addAgendaRow">添加行</el-button>
            <el-button size="mini" @click="removeAgendaRow" :disabled="agendaRows.length === 0">删除行</el-button>
            <el-button size="mini" type="primary" @click="saveAgenda">保存表格</el-button>
          </div>
        </div>
      </el-tab-pane>

      <el-tab-pane label="会议投票" name="vote">
        <div class="vote-toolbar">
          <el-button size="mini" type="primary" @click="exportVoteResults">导出投票结果</el-button>
        </div>
        <el-table v-loading="voteLoading" :data="voteList" border size="small">
          <el-table-column label="序号" type="index" width="60" align="center" />
          <el-table-column label="投票标题" prop="voteTitle" min-width="180" />
          <el-table-column label="匿名" align="center" width="80">
            <template slot-scope="scope">
              {{ formatAnonymous(scope.row.anonymousSwitch) }}
            </template>
          </el-table-column>
          <el-table-column label="操作" width="120" align="center">
            <template slot-scope="scope">
              <el-button size="mini" type="text" @click="openVoteDetail(scope.row)">详情</el-button>
            </template>
          </el-table-column>
        </el-table>

        <el-dialog :visible.sync="voteDetailVisible" :title="voteDetailTitle" width="820px" append-to-body>
          <div class="vote-detail-title">{{ voteDetailTitle }}</div>
          <el-table :data="voteDetailRows" border size="small">
            <el-table-column label="序号" type="index" width="60" align="center" />
            <el-table-column label="选项内容" prop="optionName" min-width="160" />
            <el-table-column label="已选" prop="count" width="80" align="center" />
            <el-table-column label="已投票人员姓名" prop="voters" min-width="240" />
            <el-table-column label="百分比" prop="percent" width="100" align="center" />
          </el-table>
        </el-dialog>
      </el-tab-pane>

      <el-tab-pane label="会议纪要" name="minutes">
        <el-card shadow="never">
          <el-upload
            :action="uploadUrl"
            :headers="uploadHeaders"
            :limit="1"
            :file-list="minutesFileList"
            :on-success="handleMinutesUploadSuccess"
            :on-remove="handleMinutesRemove"
          >
            <el-button size="mini" type="primary">上传文件</el-button>
            <div class="el-upload__tip" slot="tip">仅支持上传1个文件</div>
          </el-upload>
          <div class="minutes-actions">
            <el-button size="mini" :disabled="!minutesFileUrl" @click="openMinutesPreview">在线预览</el-button>
          </div>
        </el-card>
        <el-dialog :visible.sync="minutesPreviewVisible" title="会议纪要预览" width="80%" append-to-body>
          <div v-if="minutesFileUrl" class="minutes-preview">
            <iframe v-if="isMinutesPdf" :src="minutesFileUrl" frameborder="0"></iframe>
            <div v-else class="minutes-download">
              当前文件不支持在线预览，请点击下载查看。
              <el-link :href="minutesFileUrl" target="_blank">下载文件</el-link>
            </div>
          </div>
        </el-dialog>
      </el-tab-pane>
    </el-tabs>

    <!-- 修改会议信息弹窗 -->
    <el-dialog :title="'修改会议信息'" :visible.sync="editDialogVisible" width="900px" append-to-body>
      <el-form ref="editForm" :model="editForm" :rules="editRules" label-width="100px">
        <el-row :gutter="22">
          <el-col :span="12">
            <el-form-item label="所属范围" prop="deptId">
              <treeselect
                v-model="editForm.deptId"
                :options="enabledDeptOptions"
                :show-count="true"
                placeholder="请选择所属范围"
                clearable
              />
            </el-form-item>
            <el-form-item label="会议名称" prop="meetingName">
              <el-input v-model="editForm.meetingName" placeholder="请输入会议名称" />
            </el-form-item>
            <el-form-item label="副标题" prop="subtitle">
              <el-input v-model="editForm.subtitle" placeholder="请输入副标题" />
            </el-form-item>
            <el-form-item label="开始时间" prop="startTime">
              <el-date-picker
                clearable
                v-model="editForm.startTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss"
                placeholder="请选择开始时间"
              />
            </el-form-item>
            <el-form-item label="结束时间" prop="endTime">
              <el-date-picker
                clearable
                v-model="editForm.endTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss"
                placeholder="请选择结束时间"
              />
            </el-form-item>
            <el-form-item label="选择会议室" prop="roomId">
              <el-select v-model="editForm.roomId" placeholder="请选择会议室" clearable>
                <el-option v-for="item in meetingRoomOptions" :key="item.id" :label="item.name" :value="item.id" />
              </el-select>
            </el-form-item>
            <el-form-item label="会议主持人" prop="hostId">
              <el-select v-model="editForm.hostId" placeholder="请选择会议主持人" clearable filterable>
                <el-option v-for="item in userAll" :key="item.userId" :label="item.nickName" :value="item.userId" />
              </el-select>
            </el-form-item>
            <el-form-item label="会议助理" prop="assistantId">
              <el-select v-model="editForm.assistantId" placeholder="请选择会议助理" clearable filterable>
                <el-option v-for="item in userAll" :key="item.userId" :label="item.nickName" :value="item.userId" />
              </el-select>
            </el-form-item>
            <el-form-item label="会议类型" prop="typeId">
              <el-select v-model="editForm.typeId" placeholder="请选择会议类型" clearable>
                <el-option v-for="item in meetingTypeOptions" :key="item.id" :label="item.name" :value="item.id" />
              </el-select>
            </el-form-item>
            <el-form-item label="功能选择" prop="featureSelect">
              <el-checkbox
                v-model="featureAll"
                :indeterminate="featureIndeterminate"
                @change="handleFeatureAllChange"
              >全选</el-checkbox>
              <el-checkbox-group v-model="editForm.featureSelect" @change="handleFeatureSelectChange">
                <el-checkbox
                  v-for="item in meetingFeatureOptions"
                  :key="item.id"
                  :label="item.id"
                >{{ item.featureName }}</el-checkbox>
              </el-checkbox-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="会议Logo" prop="logo">
              <image-upload v-model="editForm.logo" :limit="1" />
            </el-form-item>
            <el-form-item label="座位图" prop="seatChart">
              <image-upload v-model="editForm.seatChart" :limit="1" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitEdit">保存</el-button>
        <el-button @click="editDialogVisible = false">取消</el-button>
      </div>
    </el-dialog>

    <!-- 更换皮肤弹窗 -->
    <el-dialog :title="'更换皮肤'" :visible.sync="skinDialogVisible" width="900px" append-to-body>
      <div class="skin-section">
        <div class="skin-title">PAD 背景</div>
        <div class="skin-current">
          <div class="panel-title">使用中的背景</div>
          <div class="bg-preview">
            <img v-if="skin.padCurrent" :src="resolveImageUrl(skin.padCurrent)" alt="当前背景" />
            <div v-else class="bg-empty">暂无背景</div>
          </div>
        </div>
        <el-upload
          :action="uploadUrl"
          :headers="uploadHeaders"
          :show-file-list="false"
          :limit="20"
          :on-success="(res) => handleSkinUploadSuccess(res, 'pad')"
        >
          <el-button class="skin-upload-btn">上传背景图片（PAD）</el-button>
        </el-upload>
        <div class="skin-list">
          <div
            v-for="item in padImageList"
            :key="item"
            class="skin-item"
            :class="{ active: skin.padCurrent === item }"
            @click="setSkinBackground(item, 'pad')"
          >
            <img :src="resolveImageUrl(item)" alt="pad-bg" />
            <div class="hover-mask">
              <el-button size="mini" type="primary" @click.stop="setSkinBackground(item, 'pad')">设为背景图</el-button>
            </div>
          </div>
        </div>
      </div>
      <el-divider></el-divider>
      <div class="skin-section">
        <div class="skin-title">WEB 背景</div>
        <div class="skin-current">
          <div class="panel-title">使用中的背景</div>
          <div class="bg-preview">
            <img v-if="skin.webCurrent" :src="resolveImageUrl(skin.webCurrent)" alt="当前背景" />
            <div v-else class="bg-empty">暂无背景</div>
          </div>
        </div>
        <el-upload
          :action="uploadUrl"
          :headers="uploadHeaders"
          :show-file-list="false"
          :limit="20"
          :on-success="(res) => handleSkinUploadSuccess(res, 'web')"
        >
          <el-button class="skin-upload-btn">上传背景图片（WEB）</el-button>
        </el-upload>
        <div class="skin-list">
          <div
            v-for="item in webImageList"
            :key="item"
            class="skin-item"
            :class="{ active: skin.webCurrent === item }"
            @click="setSkinBackground(item, 'web')"
          >
            <img :src="resolveImageUrl(item)" alt="web-bg" />
            <div class="hover-mask">
              <el-button size="mini" type="primary" @click.stop="setSkinBackground(item, 'web')">设为背景图</el-button>
            </div>
          </div>
        </div>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="skinDialogVisible = false">确定</el-button>
      </div>
    </el-dialog>

    <!-- 会议标语弹窗 -->
    <el-dialog :title="'会议标语'" :visible.sync="sloganDialogVisible" width="900px" append-to-body>
      <div class="dialog-actions">
        <el-upload
          :action="uploadUrl"
          :headers="uploadHeaders"
          :show-file-list="false"
          :limit="20"
          :on-success="handleSloganBgUploadSuccess"
        >
          <el-button class="skin-upload-btn">上传背景图</el-button>
        </el-upload>
        <el-button @click="openSloganPreview">预览</el-button>
        <el-button type="primary" @click="saveSlogan">保存</el-button>
      </div>
      <div class="slogan-top">
        <div class="slogan-left">
          <el-form :model="slogan" label-width="70px">
            <el-form-item label="欢迎语">
              <el-input v-model="slogan.welcomeText" />
            </el-form-item>
          </el-form>
        </div>
        <div class="slogan-right">
          <el-form :model="slogan" label-width="110px">
            <el-row :gutter="12">
              <el-col :span="8">
                <el-form-item label="主标题字体">
                  <el-select v-model="slogan.mainFont" placeholder="选择字体">
                    <el-option v-for="item in fontOptions" :key="item" :label="item" :value="item" />
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="主标题颜色">
                  <el-color-picker v-model="slogan.mainColor" />
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="主标题大小">
                  <el-select v-model="slogan.mainSize" placeholder="选择大小">
                    <el-option v-for="item in fontSizeOptions" :key="item" :label="item" :value="item" />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row :gutter="12">
              <el-col :span="8">
                <el-form-item label="其他字体">
                  <el-select v-model="slogan.otherFont" placeholder="选择字体">
                    <el-option v-for="item in fontOptions" :key="item" :label="item" :value="item" />
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="其他颜色">
                  <el-color-picker v-model="slogan.otherColor" />
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="其他大小">
                  <el-select v-model="slogan.otherSize" placeholder="选择大小">
                    <el-option v-for="item in fontSizeOptions" :key="item" :label="item" :value="item" />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </div>
      </div>
      <div class="slogan-bottom">
        <div class="bg-panel">
          <div class="panel-title">使用中的背景</div>
          <div class="bg-preview">
            <img v-if="slogan.background" :src="resolveImageUrl(slogan.background)" alt="当前背景" />
            <div v-else class="bg-empty">暂无背景</div>
          </div>
        </div>
        <div class="bg-panel">
          <div class="panel-title">可选择背景图</div>
          <div class="bg-list">
            <div
              v-for="item in backgroundOptions"
              :key="item"
              class="bg-item"
              :class="{ active: slogan.background === item }"
              @click="setSloganBackground(item)"
            >
              <img :src="resolveImageUrl(item)" alt="背景图" />
              <div class="hover-mask">
                <el-button size="mini" type="primary" @click.stop="setSloganBackground(item)">设为背景图</el-button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </el-dialog>

    <!-- 背屏设置弹窗 -->
    <el-dialog :title="'背屏设置'" :visible.sync="backscreenDialogVisible" width="900px" append-to-body>
      <div class="dialog-actions">
        <el-upload
          :action="uploadUrl"
          :headers="uploadHeaders"
          :show-file-list="false"
          :limit="20"
          :on-success="handleBackscreenBgUploadSuccess"
        >
          <el-button class="skin-upload-btn">上传背景图</el-button>
        </el-upload>
        <el-button type="primary" @click="saveBackscreen">保存</el-button>
      </div>
      <div class="slogan-top">
        <div class="slogan-right">
          <el-form :model="backscreen" label-width="110px">
            <el-row :gutter="12">
              <el-col :span="8">
                <el-form-item label="主标题字体">
                  <el-select v-model="backscreen.mainFont" placeholder="选择字体">
                    <el-option v-for="item in fontOptions" :key="item" :label="item" :value="item" />
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="主标题颜色">
                  <el-color-picker v-model="backscreen.mainColor" />
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="主标题大小">
                  <el-select v-model="backscreen.mainSize" placeholder="选择大小">
                    <el-option v-for="item in fontSizeOptions" :key="item" :label="item" :value="item" />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row :gutter="12">
              <el-col :span="8">
                <el-form-item label="其他字体">
                  <el-select v-model="backscreen.subFont" placeholder="选择字体">
                    <el-option v-for="item in fontOptions" :key="item" :label="item" :value="item" />
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="其他颜色">
                  <el-color-picker v-model="backscreen.subColor" />
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="其他大小">
                  <el-select v-model="backscreen.subSize" placeholder="选择大小">
                    <el-option v-for="item in fontSizeOptions" :key="item" :label="item" :value="item" />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </div>
      </div>
      <div class="slogan-bottom">
        <div class="bg-panel">
          <div class="panel-title">使用中的背景</div>
          <div class="bg-preview">
            <img v-if="backscreen.background" :src="resolveImageUrl(backscreen.background)" alt="当前背景" />
            <div v-else class="bg-empty">暂无背景</div>
          </div>
        </div>
        <div class="bg-panel">
          <div class="panel-title">可选择背景图</div>
          <div class="bg-list">
            <div
              v-for="item in backgroundOptions"
              :key="item"
              class="bg-item"
              :class="{ active: backscreen.background === item }"
              @click="setBackscreenBackground(item)"
            >
              <img :src="resolveImageUrl(item)" alt="背景图" />
              <div class="hover-mask">
                <el-button size="mini" type="primary" @click.stop="setBackscreenBackground(item)">设为背景图</el-button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getMeeting, updateMeeting, listMeetingRoom, listMeetingType, listMeetingFeature } from "@/api/ipms/meeting"
import { listImage, addImage } from "@/api/ipms/image"
import { listVote } from "@/api/ipms/vote"
import { listUser, deptTreeSelect } from "@/api/system/user"
import { getToken } from "@/utils/auth"
import Treeselect from "@riophae/vue-treeselect"
import "@riophae/vue-treeselect/dist/vue-treeselect.css"
import * as XLSX from "xlsx"

const PAD_BG_LIST = [
  "/meeting-bg/pad/1.jpg",
  "/meeting-bg/pad/2.jpg",
  "/meeting-bg/pad/3.jpg",
  "/meeting-bg/pad/4.jpg",
  "/meeting-bg/pad/5.jpg",
  "/meeting-bg/pad/6.jpg",
  "/meeting-bg/pad/7.jpg",
  "/meeting-bg/pad/8.jpg",
  "/meeting-bg/pad/9.jpg",
  "/meeting-bg/pad/10.jpg"
]

const WEB_BG_LIST = [
  "/meeting-bg/web/1.jpg",
  "/meeting-bg/web/2.jpg",
  "/meeting-bg/web/3.png",
  "/meeting-bg/web/4.png",
  "/meeting-bg/web/5.jpg",
  "/meeting-bg/web/6.jpg",
  "/meeting-bg/web/7.jpg",
  "/meeting-bg/web/8.jpg",
  "/meeting-bg/web/9.png",
  "/meeting-bg/web/background_01.jpg",
  "/meeting-bg/web/background_02.jpg",
  "/meeting-bg/web/background_03.jpg",
  "/meeting-bg/web/background_04.jpg",
  "/meeting-bg/web/background_05.jpg",
  "/meeting-bg/web/background_06.jpg",
  "/meeting-bg/web/background_07.jpg",
  "/meeting-bg/web/background_08.jpg",
  "/meeting-bg/web/background_09.jpg",
  "/meeting-bg/web/background_10.jpg",
  "/meeting-bg/web/background_11.jpg",
  "/meeting-bg/web/background_12.jpg",
  "/meeting-bg/web/background_13.jpg"
]

const FONT_OPTIONS = [
  "方正小标宋简体",
  "黑体",
  "仿宋",
  "宋体",
  "楷体",
  "微软正黑体",
  "微软雅黑体"
]

const FONT_SIZE_OPTIONS = Array.from({ length: 14 }, (_, idx) => `${idx + 2}em`)

export default {
  name: "MeetingDetail",
  components: { Treeselect },
  data() {
    return {
      activeTab: "info",
      meetingId: null,
      meeting: {},
      enabledDeptOptions: [],
      meetingRoomOptions: [],
      meetingTypeOptions: [],
      meetingFeatureOptions: [],
      featureAll: false,
      featureIndeterminate: false,
      imageList: [],
      userAll: [],
      userOptions: [],
      userSearchName: "",
      selectedSearchName: "",
      memberTab: "selected",
      memberIds: [],
      selectedSelection: [],
      availableSelection: [],
      editDialogVisible: false,
      editForm: {
        featureSelect: []
      },
      editRules: {
        deptId: [{ required: true, message: "请选择所属范围", trigger: "change" }],
        meetingName: [{ required: true, message: "会议名称不能为空", trigger: "blur" }],
        startTime: [{ required: true, message: "开始时间不能为空", trigger: "change" }],
        endTime: [{ required: true, message: "结束时间不能为空", trigger: "change" }],
        roomId: [{ required: true, message: "请选择会议室", trigger: "change" }],
        hostId: [{ required: true, message: "请选择主持人", trigger: "change" }],
        typeId: [{ required: true, message: "请选择会议类型", trigger: "change" }]
      },
      skinDialogVisible: false,
      sloganDialogVisible: false,
      backscreenDialogVisible: false,
      skin: {
        padImages: PAD_BG_LIST.slice(),
        webImages: WEB_BG_LIST.slice(),
        padCurrent: PAD_BG_LIST[0] || "",
        webCurrent: WEB_BG_LIST[0] || ""
      },
      fontOptions: FONT_OPTIONS.slice(),
      fontSizeOptions: FONT_SIZE_OPTIONS.slice(),
      slogan: {
        welcomeText: "欢迎您莅临此次会议",
        usingText: "",
        mainFont: "方正小标宋简体",
        mainColor: "#ffffff",
        mainSize: "8em",
        otherFont: "方正小标宋简体",
        otherColor: "#ffffff",
        otherSize: "2em",
        background: ""
      },
      backscreen: {
        mainFont: "黑体",
        mainColor: "#ffffff",
        mainSize: "8em",
        subFont: "黑体",
        subColor: "#ffffff",
        subSize: "2em",
        background: ""
      },
      voteList: [],
      voteLoading: false,
      voteDetailVisible: false,
      voteDetailTitle: "",
      voteDetailRows: [],
      voteDetailRecords: [],
      agendaExtraColumns: [],
      agendaRows: [],
      agendaDirty: false,
      minutesFileUrl: "",
      minutesFileList: [],
      minutesPreviewVisible: false,
      uploadUrl: process.env.VUE_APP_BASE_API + "/common/upload",
      uploadHeaders: {
        Authorization: "Bearer " + getToken()
      },
      statusMap: {
        unpublished: 0,
        inProgress: 1,
        ended: 2
      }
    }
  },
  computed: {
    meetingStatus() {
      const value = this.meeting.status
      return value === null || value === undefined ? this.statusMap.unpublished : Number(value)
    },
    meetingTimeText() {
      const start = this.parseTime(this.meeting.startTime, "{y}-{m}-{d} {h}:{i}:{s}")
      const end = this.parseTime(this.meeting.endTime, "{y}-{m}-{d} {h}:{i}:{s}")
      if (!start && !end) {
        return ""
      }
      return `${start || ""} \u81F3 ${end || ""}`
    },
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
    },
    memberNamesText() {
      return this.selectedMembers.map(user => user.nickName).join("\uFF0C")
    },
    padImageList() {
      const list = this.imageList
        .filter(item => String(item.type).toLowerCase() === "pad")
        .map(item => item.url)
        .filter(Boolean)
      return list.length ? list : this.splitImages(this.skin.padImages)
    },
    webImageList() {
      const list = this.imageList
        .filter(item => String(item.type).toLowerCase() === "web")
        .map(item => item.url)
        .filter(Boolean)
      return list.length ? list : this.splitImages(this.skin.webImages)
    },
    backgroundOptions() {
      const list = this.imageList.map(item => item.url).filter(Boolean)
      if (list.length) {
        return Array.from(new Set(list))
      }
      const pad = this.splitImages(this.skin.padImages)
      const web = this.splitImages(this.skin.webImages)
      return Array.from(new Set(pad.concat(web)))
    },
    isMinutesPdf() {
      return this.minutesFileUrl && this.minutesFileUrl.toLowerCase().includes(".pdf")
    }
  },
  created() {
    this.meetingId = this.$route.params.id || this.$route.query.id
    if (!this.meetingId) {
      this.$modal.msgError("未获取到会议ID")
      return
    }
    this.loadMeeting()
    this.loadOptions()
    this.loadDeptTree()
    this.loadMeetingFeatures()
    this.loadImages()
    this.loadUsers()
    this.loadMembers()
    this.loadAgenda()
    this.loadVotes()
    this.loadSloganSettings()
    this.loadBackscreenSettings()
    this.ensureBackgroundDefaults()
  },
  methods: {
    loadMeeting() {
      getMeeting(this.meetingId).then(res => {
        this.meeting = res.data || {}
      })
    },
    loadOptions() {
      listMeetingRoom({ pageNum: 1, pageSize: 1000 }).then(res => {
        this.meetingRoomOptions = res.rows || []
      })
      listMeetingType({ pageNum: 1, pageSize: 1000 }).then(res => {
        this.meetingTypeOptions = res.rows || []
      })
    },
    loadDeptTree() {
      deptTreeSelect().then(res => {
        const data = res.data || []
        this.enabledDeptOptions = this.filterDisabledDept(JSON.parse(JSON.stringify(data)))
      })
    },
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
    loadMeetingFeatures() {
      listMeetingFeature({ pageNum: 1, pageSize: 20 }).then(res => {
        this.meetingFeatureOptions = res.rows || []
        this.refreshFeatureSelectState()
      })
    },
    loadImages() {
      listImage({ pageNum: 1, pageSize: 1000 }).then(res => {
        this.imageList = res.rows || []
        this.ensureBackgroundDefaults()
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
    },
    handleAvailableSelectionChange(selection) {
      this.availableSelection = selection || []
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
      if (!this.availableSelection.length) {
        return
      }
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
      if (!this.selectedSelection.length) {
        return
      }
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
    loadMembers() {
      const key = this.membersStorageKey()
      const raw = localStorage.getItem(key)
      this.memberIds = raw ? JSON.parse(raw) : []
    },
    saveMembers() {
      localStorage.setItem(this.membersStorageKey(), JSON.stringify(this.memberIds))
    },
    membersStorageKey() {
      return `ipms_meeting_members_${this.meetingId}`
    },
    getUserName(userId) {
      const user = this.userAll.find(item => String(item.userId) === String(userId))
      return user ? user.nickName : ""
    },
    getRoomName(roomId) {
      const room = this.meetingRoomOptions.find(item => String(item.id) === String(roomId))
      return room ? room.name : ""
    },
    getTypeName(typeId) {
      const type = this.meetingTypeOptions.find(item => String(item.id) === String(typeId))
      return type ? type.name : ""
    },
    handleFeatureAllChange(val) {
      if (val) {
        this.editForm.featureSelect = this.meetingFeatureOptions.map(item => item.id)
      } else {
        this.editForm.featureSelect = []
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
      const selected = Array.isArray(this.editForm.featureSelect) ? this.editForm.featureSelect : []
      const total = this.meetingFeatureOptions.length
      const checkedCount = selected.length
      this.featureAll = total > 0 && checkedCount === total
      this.featureIndeterminate = checkedCount > 0 && checkedCount < total
    },
    openEditDialog() {
      let deptId = null
      if (this.meeting.scope !== null && this.meeting.scope !== undefined && this.meeting.scope !== "") {
        const scopeNumber = Number(this.meeting.scope)
        deptId = Number.isNaN(scopeNumber) ? this.meeting.scope : scopeNumber
      }
      let featureSelect = []
      if (Array.isArray(this.meeting.featureSelect)) {
        featureSelect = this.meeting.featureSelect.map(item => Number(item))
      } else if (this.meeting.featureSelect) {
        featureSelect = String(this.meeting.featureSelect).split(",").map(item => Number(item))
      }
      this.editForm = {
        id: this.meeting.id,
        deptId,
        meetingName: this.meeting.meetingName,
        subtitle: this.meeting.subtitle,
        startTime: this.parseTime(this.meeting.startTime, "{y}-{m}-{d} {h}:{i}:{s}"),
        endTime: this.parseTime(this.meeting.endTime, "{y}-{m}-{d} {h}:{i}:{s}"),
        roomId: this.meeting.roomId,
        hostId: this.meeting.hostId,
        assistantId: this.meeting.assistantId,
        typeId: this.meeting.typeId,
        featureSelect,
        logo: this.meeting.logo,
        seatChart: this.meeting.seatChart
      }
      this.refreshFeatureSelectState()
      this.editDialogVisible = true
    },
    submitEdit() {
      this.$refs.editForm.validate(valid => {
        if (!valid) return
        const payload = {
          ...this.editForm,
          scope: this.editForm.deptId,
          featureSelect: Array.isArray(this.editForm.featureSelect)
            ? this.editForm.featureSelect.join(",")
            : this.editForm.featureSelect
        }
        updateMeeting(payload).then(() => {
          this.$modal.msgSuccess("修改成功")
          this.editDialogVisible = false
          this.loadMeeting()
        })
      })
    },
    publishMeeting() {
      this.updateMeetingStatus(this.statusMap.ended)
    },
    cancelPublishMeeting() {
      this.updateMeetingStatus(this.statusMap.unpublished)
    },
    openMeeting() {
      this.updateMeetingStatus(this.statusMap.inProgress)
    },
    closeMeeting() {
      this.updateMeetingStatus(this.statusMap.ended)
    },
    packOpinions() {
      this.$modal.msgSuccess("一键打包处理中")
    },
    updateMeetingStatus(status) {
      updateMeeting({ id: this.meeting.id, status }).then(() => {
        this.meeting.status = status
        this.$modal.msgSuccess("状态已更新")
      })
    },
    downloadAgendaFile() {
      this.$modal.msgSuccess("暂无可下载的议程文件")
    },
    handleSkinUploadSuccess(res, type) {
      if (res.code !== 200) {
        this.$modal.msgError(res.msg || "上传失败")
        return
      }
      const path = res.url || res.fileName
      if (!path) return
      this.persistImage(path, type)
      this.appendBackground(path, type)
      this.setSkinBackground(path, type)
    },
    setSkinBackground(path, type) {
      if (type === "pad") {
        this.skin.padCurrent = path
      } else {
        this.skin.webCurrent = path
      }
    },
    handleSloganBgUploadSuccess(res) {
      const path = res.url || res.fileName
      if (res.code !== 200 || !path) {
        this.$modal.msgError(res.msg || "上传失败")
        return
      }
      this.persistImage(path, "other")
      this.appendBackground(path, "other")
      this.setSloganBackground(path)
    },
    handleBackscreenBgUploadSuccess(res) {
      const path = res.url || res.fileName
      if (res.code !== 200 || !path) {
        this.$modal.msgError(res.msg || "上传失败")
        return
      }
      this.persistImage(path, "other")
      this.appendBackground(path, "other")
      this.setBackscreenBackground(path)
    },
    setSloganBackground(path) {
      this.slogan.background = path
    },
    setBackscreenBackground(path) {
      this.backscreen.background = path
    },
    appendBackground(path, type) {
      const list = this.imageList.map(item => item.url)
      if (!list.includes(path)) {
        this.imageList = this.imageList.concat({ url: path, type })
      }
    },
    persistImage(path, type) {
      if (!path) return
      const exists = this.imageList.some(item => item.url === path)
      if (exists) return
      addImage({ url: path, type, isSystem: 0 }).then(() => {
        this.loadImages()
      }).catch(() => {})
    },
    resolveImageUrl(path) {
      if (!path) return ""
      if (path.startsWith("http")) return path
      if (path.startsWith("/meeting-bg/")) return path
      return this.fileFullUrl(path)
    },
    saveSlogan() {
      const payload = { ...this.slogan, usingText: "" }
      localStorage.setItem(this.sloganStorageKey(), JSON.stringify(payload))
      this.$modal.msgSuccess("保存成功")
    },
    saveBackscreen() {
      localStorage.setItem(this.backscreenStorageKey(), JSON.stringify(this.backscreen))
      this.$modal.msgSuccess("保存成功")
    },
    loadSloganSettings() {
      const raw = localStorage.getItem(this.sloganStorageKey())
      if (raw) {
        try {
          const data = JSON.parse(raw)
          if (data && Object.prototype.hasOwnProperty.call(data, "usingText")) {
            delete data.usingText
          }
          this.slogan = { ...this.slogan, ...data, usingText: "" }
        } catch (e) {
          // ignore parse error
        }
      }
    },
    loadBackscreenSettings() {
      const raw = localStorage.getItem(this.backscreenStorageKey())
      if (raw) {
        try {
          const data = JSON.parse(raw)
          this.backscreen = { ...this.backscreen, ...data }
        } catch (e) {
          // ignore parse error
        }
      }
    },
    sloganStorageKey() {
      return `ipms_meeting_slogan_${this.meetingId}`
    },
    backscreenStorageKey() {
      return `ipms_meeting_backscreen_${this.meetingId}`
    },
    ensureBackgroundDefaults() {
      if (!this.skin.padCurrent && this.padImageList.length) {
        this.skin.padCurrent = this.padImageList[0]
      }
      if (!this.skin.webCurrent && this.webImageList.length) {
        this.skin.webCurrent = this.webImageList[0]
      }
      if (!this.slogan.background && this.backgroundOptions.length) {
        this.slogan.background = this.backgroundOptions[0]
      }
      if (!this.backscreen.background && this.backgroundOptions.length) {
        this.backscreen.background = this.backgroundOptions[0]
      }
    },
    openSloganPreview() {
      const payload = {
        ...this.slogan,
        background: this.slogan.background
      }
      localStorage.setItem("ipms_meeting_slogan_preview", JSON.stringify(payload))
      const routeUrl = this.$router.resolve({
        path: "/ipms/meeting/slogan-preview",
        query: { id: this.meetingId }
      })
      window.open(routeUrl.href, "_blank")
    },
    splitImages(value) {
      if (!value) return []
      if (Array.isArray(value)) return value
      return value.split(",").filter(item => item)
    },
    addAgendaColumn() {
      const index = this.agendaExtraColumns.length + 1
      const key = `extra_${index}_${Date.now()}`
      this.agendaExtraColumns.push({ key, label: `自定义列${index}` })
      this.agendaRows.forEach(row => {
        this.$set(row.extra, key, "")
      })
      this.markAgendaDirty()
    },
    removeAgendaColumn() {
      const removed = this.agendaExtraColumns.pop()
      if (removed) {
        this.agendaRows.forEach(row => {
          if (row.extra && Object.prototype.hasOwnProperty.call(row.extra, removed.key)) {
            this.$delete(row.extra, removed.key)
          }
        })
        this.markAgendaDirty()
      }
    },
    addAgendaRow() {
      const key = `row_${Date.now()}_${Math.random().toString(16).slice(2)}`
      const row = {
        key,
        topicName: "",
        mainFile: "",
        mainFileName: "",
        extra: {}
      }
      this.agendaExtraColumns.forEach(col => {
        row.extra[col.key] = ""
      })
      this.agendaRows.push(row)
      this.markAgendaDirty()
    },
    removeAgendaRow() {
      this.agendaRows.pop()
      this.markAgendaDirty()
    },
    markAgendaDirty() {
      this.agendaDirty = true
    },
    saveAgenda() {
      const payload = {
        columns: this.agendaExtraColumns,
        rows: this.agendaRows
      }
      localStorage.setItem(this.agendaStorageKey(), JSON.stringify(payload))
      this.agendaDirty = false
      this.$modal.msgSuccess("表格已保存")
    },
    loadAgenda() {
      const raw = localStorage.getItem(this.agendaStorageKey())
      if (raw) {
        const payload = JSON.parse(raw)
        this.agendaExtraColumns = payload.columns || []
        this.agendaRows = payload.rows || []
      } else {
        this.agendaRows = []
        this.addAgendaRow()
        this.agendaDirty = false
      }
    },
    agendaStorageKey() {
      return `ipms_meeting_agenda_${this.meetingId}`
    },
    beforeAgendaFileUpload(file, row) {
      if (this.agendaDirty) {
        return this.$modal.confirm("请先保存当前表格格式后才能上传文件，是否立即保存？").then(() => {
          this.saveAgenda()
          return true
        }).catch(() => false)
      }
      return true
    },
    handleAgendaFileSuccess(res, file, row) {
      if (res.code === 200) {
        row.mainFile = res.fileName
        row.mainFileName = res.originalFilename || file.name
        this.markAgendaDirty()
      } else {
        this.$modal.msgError(res.msg || "上传失败")
      }
    },
    fileFullUrl(path) {
      if (!path) return ""
      if (path.startsWith("http")) return path
      return process.env.VUE_APP_BASE_API + path
    },
    openMaterial(row) {
      if (!row.topicName) {
        this.$modal.msgError("请先输入议题名称")
        return
      }
      this.$router.push({ path: "/ipms/material", query: { meetingId: this.meetingId, topic: row.topicName } })
    },
    openAgendaMembers(row) {
      this.$router.push({
        path: `/ipms/meeting/agenda-members/${this.meetingId}`,
        query: { topicKey: row.key, topicName: row.topicName }
      })
    },
    getAgendaMemberCount(row) {
      const key = this.agendaMembersStorageKey(row)
      const raw = localStorage.getItem(key)
      if (!raw) return 0
      try {
        const arr = JSON.parse(raw)
        return Array.isArray(arr) ? arr.length : 0
      } catch (e) {
        return 0
      }
    },
    agendaMembersStorageKey(row) {
      return `ipms_agenda_members_${this.meetingId}_${row.key}`
    },
    loadVotes() {
      this.voteLoading = true
      listVote({ pageNum: 1, pageSize: 1000, meetingId: this.meetingId }).then(res => {
        const rows = res.rows || []
        if (rows.length && Object.prototype.hasOwnProperty.call(rows[0], "meetingId")) {
          this.voteList = rows.filter(row => String(row.meetingId) === String(this.meetingId))
        } else {
          this.voteList = rows
        }
        this.voteLoading = false
      }).catch(() => {
        this.voteLoading = false
      })
    },
    formatAnonymous(value) {
      return Number(value) === 1 ? "是" : "否"
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
          voters: voters.join("\uFF0C"),
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
      const meetingName = this.meeting.meetingName || "会议"
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
        }).join("\uFF0C")
        summaryRows.push([idx + 1, vote.voteTitle || `投票${idx + 1}`, optionText])
      })
      const summarySheet = XLSX.utils.aoa_to_sheet(summaryRows)
      summarySheet["!merges"] = [{ s: { r: 0, c: 0 }, e: { r: 0, c: 2 } }]
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
        sheet["!merges"] = [{ s: { r: 0, c: 0 }, e: { r: 0, c: 4 } }]
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
      return { options, counts, total, votersMap, records }
    },
    getVoteOptions(vote) {
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
          return item.split(/[,，;；、]/).map(opt => opt.trim()).filter(Boolean)
        }
      }
      const mode = String(vote.voteMode || "")
      if (mode === "2") {
        return ["赞成", "反对"]
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
          users = users.split(/[,，;；、]/).map(val => val.trim()).filter(Boolean)
        }
        if (Array.isArray(users)) {
          users = users.map(user => {
            if (typeof user === "string") return user
            if (!user) return ""
            return user.nickName || user.userName || user.name || ""
          }).filter(Boolean)
        }
        const count = rawCount !== null && rawCount !== undefined ? Number(rawCount) : (Array.isArray(users) ? users.length : 0)
        return { name, count, users }
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
    },
    handleMinutesUploadSuccess(res, file) {
      if (res.code === 200) {
        this.minutesFileUrl = res.url || this.fileFullUrl(res.fileName)
        this.minutesFileList = [{ name: res.originalFilename || file.name, url: this.minutesFileUrl }]
        this.$modal.msgSuccess("上传成功")
      } else {
        this.$modal.msgError(res.msg || "上传失败")
      }
    },
    handleMinutesRemove() {
      this.minutesFileUrl = ""
      this.minutesFileList = []
    },
    openMinutesPreview() {
      this.minutesPreviewVisible = true
    }
  }
}
</script>

<style scoped>
.meeting-detail {
  min-height: 100%;
}

.info-actions {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-bottom: 16px;
}

.action-row {
  width: 100%;
}

.action-left {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.action-right {
  display: flex;
  justify-content: flex-end;
  flex-wrap: wrap;
  gap: 8px;
}

.info-center {
  min-height: 60vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.info-card {
  width: 100%;
  max-width: 720px;
  margin-top: 8px;
}

.info-title {
  font-size: 28px;
  font-weight: 600;
  text-align: center;
  margin-bottom: 18px;
  letter-spacing: 2px;
}

.info-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
  font-size: 14px;
}

.info-item {
  display: flex;
  justify-content: center;
  gap: 8px;
}

.info-label {
  width: 120px;
  text-align: right;
  color: #606266;
}

.info-value {
  min-width: 240px;
  max-width: 460px;
  text-align: left;
  word-break: break-word;
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

.dialog-actions {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 8px;
  margin-bottom: 16px;
}

.agenda-toolbar,
.agenda-footer {
  display: flex;
  justify-content: flex-end;
  margin: 10px 0;
}

.toolbar-right {
  display: flex;
  gap: 8px;
}

.agenda-file-link {
  margin-left: 8px;
}

.member-count {
  margin-left: 6px;
  color: #409eff;
}

.minutes-actions {
  margin-top: 12px;
}

.minutes-preview iframe {
  width: 100%;
  height: 70vh;
}

.minutes-download {
  padding: 12px 0;
}

.skin-section {
  margin-bottom: 16px;
}

.skin-title {
  font-weight: 600;
  margin-bottom: 8px;
}

.skin-current {
  margin-bottom: 12px;
}

.skin-upload-btn {
  background: #7cb63d;
  border-color: #7cb63d;
  color: #fff;
}

.skin-upload-btn:hover,
.skin-upload-btn:focus {
  background: #6aa62f;
  border-color: #6aa62f;
  color: #fff;
}

.skin-list {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-top: 12px;
}

.skin-item {
  width: 120px;
  height: 70px;
  position: relative;
  border: 1px solid #e4e7ed;
  border-radius: 4px;
  overflow: hidden;
  cursor: pointer;
  position: relative;
}

.skin-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.hover-mask {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.45);
  opacity: 0;
  transition: opacity 0.2s ease;
  z-index: 1;
}

.skin-item:hover .hover-mask,
.bg-item:hover .hover-mask {
  opacity: 1;
}

.skin-item.active {
  border-color: #7cb63d;
  box-shadow: 0 0 0 2px rgba(124, 182, 61, 0.25);
}

.slogan-top {
  display: flex;
  gap: 16px;
  margin-bottom: 16px;
}

.slogan-left {
  flex: 1;
  min-width: 260px;
}

.slogan-right {
  flex: 2;
  min-width: 320px;
}

.slogan-right ::v-deep .el-select,
.slogan-left ::v-deep .el-select {
  width: 100%;
}

.slogan-bottom {
  display: flex;
  gap: 16px;
}

.bg-panel {
  flex: 1;
}

.panel-title {
  font-weight: 600;
  margin-bottom: 8px;
}

.bg-preview {
  width: 100%;
  height: 160px;
  border: 1px solid #e4e7ed;
  border-radius: 6px;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f5f7fa;
}

.bg-preview img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.bg-empty {
  color: #909399;
  font-size: 14px;
}

.bg-list {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
}

.bg-item {
  width: 120px;
  height: 70px;
  position: relative;
  border: 1px solid #e4e7ed;
  border-radius: 4px;
  overflow: hidden;
  cursor: pointer;
  position: relative;
}

.bg-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.bg-item.active {
  border-color: #7cb63d;
  box-shadow: 0 0 0 2px rgba(124, 182, 61, 0.25);
}

.vote-toolbar {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 12px;
}

.vote-detail-title {
  font-weight: 600;
  margin-bottom: 10px;
}

@media (max-width: 992px) {
  .slogan-top,
  .slogan-bottom {
    flex-direction: column;
  }
}
</style>
