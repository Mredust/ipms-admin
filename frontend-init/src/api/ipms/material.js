import request from '@/utils/request'

// 查询会议资料列表
export function listMaterial(query) {
  return request({
    url: '/ipms/material/list',
    method: 'get',
    params: query
  })
}

// 查询会议资料详细
export function getMaterial(id) {
  return request({
    url: '/ipms/material/' + id,
    method: 'get'
  })
}

// 新增会议资料
export function addMaterial(data) {
  return request({
    url: '/ipms/material',
    method: 'post',
    data: data,
    headers: { 'Content-Type': 'multipart/form-data' }
  })
}

// 修改会议资料
export function updateMaterial(data) {
  return request({
    url: '/ipms/material',
    method: 'put',
    data: data,
    headers: { 'Content-Type': 'multipart/form-data' }
  })
}

// 删除会议资料
export function delMaterial(id) {
  return request({
    url: '/ipms/material/' + id,
    method: 'delete'
  })
}
