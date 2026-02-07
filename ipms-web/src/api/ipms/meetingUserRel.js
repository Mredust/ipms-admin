import request from '@/utils/request'

// 查询会议-参会人员关联列表
export function listMeetingUserRel(query) {
  return request({
    url: '/ipms/rel/list',
    method: 'get',
    params: query
  })
}

// 新增会议-参会人员关联
export function addMeetingUserRel(data) {
  return request({
    url: '/ipms/rel',
    method: 'post',
    data: data
  })
}

// 修改会议-参会人员关联
export function updateMeetingUserRel(data) {
  return request({
    url: '/ipms/rel',
    method: 'put',
    data: data
  })
}
