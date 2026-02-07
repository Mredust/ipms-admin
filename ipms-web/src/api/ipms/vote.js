import request from '@/utils/request'

// 查询投票列表
export function listVote(query) {
  return request({
    url: '/ipms/vote/list',
    method: 'get',
    params: query
  })
}

// 查询投票详细
export function getVote(id) {
  return request({
    url: '/ipms/vote/' + id,
    method: 'get'
  })
}

// 新增投票
export function addVote(data) {
  return request({
    url: '/ipms/vote',
    method: 'post',
    data: data
  })
}

// 修改投票
export function updateVote(data) {
  return request({
    url: '/ipms/vote',
    method: 'put',
    data: data
  })
}

// 删除投票
export function delVote(id) {
  return request({
    url: '/ipms/vote/' + id,
    method: 'delete'
  })
}
