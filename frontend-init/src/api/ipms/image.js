import request from '@/utils/request'

// 查询图片列表
export function listImage(query) {
  return request({
    url: '/ipms/image/list',
    method: 'get',
    params: query
  })
}

// 查询图片详细
export function getImage(id) {
  return request({
    url: '/ipms/image/' + id,
    method: 'get'
  })
}

// 新增图片
export function addImage(data) {
  return request({
    url: '/ipms/image',
    method: 'post',
    data: data
  })
}

// 修改图片
export function updateImage(data) {
  return request({
    url: '/ipms/image',
    method: 'put',
    data: data
  })
}

// 删除图片
export function delImage(id) {
  return request({
    url: '/ipms/image/' + id,
    method: 'delete'
  })
}
