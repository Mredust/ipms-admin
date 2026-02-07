import request from '@/utils/request'

// 查询会议列表
export function listMeeting(query) {
  return request({
    url: '/ipms/meeting/list',
    method: 'get',
    params: query
  })
}

// 查询会议详细
export function getMeeting(id) {
  return request({
    url: '/ipms/meeting/' + id,
    method: 'get'
  })
}

// 新增会议
export function addMeeting(data) {
  return request({
    url: '/ipms/meeting',
    method: 'post',
    data: data
  })
}

// 修改会议
export function updateMeeting(data) {
  return request({
    url: '/ipms/meeting',
    method: 'put',
    data: data
  })
}

// 删除会议
export function delMeeting(id) {
  return request({
    url: '/ipms/meeting/' + id,
    method: 'delete'
  })
}

// 查询会议类型列表
export function listMeetingType(query) {
  return request({
    url: '/ipms/type/list',
    method: 'get',
    params: query
  })
}

// 查询会议室列表
export function listMeetingRoom(query) {
  return request({
    url: '/ipms/room/list',
    method: 'get',
    params: query
  })
}

// 查询会议功能列表
export function listMeetingFeature(query) {
  return request({
    url: '/ipms/feature/list',
    method: 'get',
    params: query
  })
}
