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
