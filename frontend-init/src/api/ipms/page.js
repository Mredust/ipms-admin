import request from '@/utils/request'

// 查询登录页列表
export function listPage(query) {
  return request({
    url: '/ipms/page/list',
    method: 'get',
    params: query
  })
}

// 查询登录页详细
export function getPage(id) {
  return request({
    url: '/ipms/page/' + id,
    method: 'get'
  })
}

// 新增登录页
export function addPage(data) {
  return request({
    url: '/ipms/page',
    method: 'post',
    data: data
  })
}

// 修改登录页
export function updatePage(data) {
  return request({
    url: '/ipms/page',
    method: 'put',
    data: data
  })
}

// 删除登录页
export function delPage(id) {
  return request({
    url: '/ipms/page/' + id,
    method: 'delete'
  })
}
