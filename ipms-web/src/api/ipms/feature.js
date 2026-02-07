import request from '@/utils/request'

// 查询会议功能列表
export function listFeature(query) {
  return request({
    url: '/ipms/feature/list',
    method: 'get',
    params: query
  })
}

// 查询会议功能详细
export function getFeature(id) {
  return request({
    url: '/ipms/feature/' + id,
    method: 'get'
  })
}

// 新增会议功能
export function addFeature(data) {
  return request({
    url: '/ipms/feature',
    method: 'post',
    data: data
  })
}

// 修改会议功能
export function updateFeature(data) {
  return request({
    url: '/ipms/feature',
    method: 'put',
    data: data
  })
}

// 删除会议功能
export function delFeature(id) {
  return request({
    url: '/ipms/feature/' + id,
    method: 'delete'
  })
}
