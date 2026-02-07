import request from '@/utils/request'

export function getSlogan(id) {
  return request({
    url: `/ipms/slogan/${id}`,
    method: 'get'
  })
}

export function updateSlogan(data) {
  return request({
    url: '/ipms/slogan',
    method: 'put',
    data
  })
}
