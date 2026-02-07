import request from '@/utils/request'

// 查询机构列表
export function listOrganization(query) {
  return request({
    url: '/ipms/organization/list',
    method: 'get',
    params: query
  })
}

// 查询机构详细
export function getOrganization(id) {
  return request({
    url: '/ipms/organization/' + id,
    method: 'get'
  })
}

// 新增机构
export function addOrganization(data) {
  return request({
    url: '/ipms/organization',
    method: 'post',
    data: data
  })
}

// 修改机构
export function updateOrganization(data) {
  return request({
    url: '/ipms/organization',
    method: 'put',
    data: data
  })
}

// 删除机构
export function delOrganization(id) {
  return request({
    url: '/ipms/organization/' + id,
    method: 'delete'
  })
}
