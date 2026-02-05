import request from '@/utils/request'

// 查询会议类型列表
export function listType(query) {
  return request({
    url: '/ipms/type/list',
    method: 'get',
    params: query
  })
}

// 查询会议类型详细
export function getType(id) {
  return request({
    url: '/ipms/type/' + id,
    method: 'get'
  })
}

// 新增会议类型
export function addType(data) {
  return request({
    url: '/ipms/type',
    method: 'post',
    data: data
  })
}

// 修改会议类型
export function updateType(data) {
  return request({
    url: '/ipms/type',
    method: 'put',
    data: data
  })
}

// 删除会议类型
export function delType(id) {
  return request({
    url: '/ipms/type/' + id,
    method: 'delete'
  })
}
