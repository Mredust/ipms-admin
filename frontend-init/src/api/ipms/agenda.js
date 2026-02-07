import request from '@/utils/request'

export function getAgenda(id) {
  return request({
    url: `/ipms/agenda/${id}`,
    method: 'get'
  })
}

export function updateAgenda(data) {
  return request({
    url: '/ipms/agenda',
    method: 'put',
    data
  })
}
