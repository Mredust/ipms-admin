import request from '@/utils/request'

// 查询会议室列表
export function listRoom(query) {
  return request({
    url: '/ipms/room/list',
    method: 'get',
    params: query
  })
}

// 查询会议室详细
export function getRoom(id) {
  return request({
    url: '/ipms/room/' + id,
    method: 'get'
  })
}

// 新增会议室
export function addRoom(data) {
  return request({
    url: '/ipms/room',
    method: 'post',
    data: data
  })
}

// 修改会议室
export function updateRoom(data) {
  return request({
    url: '/ipms/room',
    method: 'put',
    data: data
  })
}

// 删除会议室
export function delRoom(id) {
  return request({
    url: '/ipms/room/' + id,
    method: 'delete'
  })
}
