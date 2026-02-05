package com.ruoyi.ipms.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.OrganizationMapper;
import com.ruoyi.ipms.domain.Organization;
import com.ruoyi.ipms.service.IOrganizationService;

/**
 * 机构Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@Service
public class OrganizationServiceImpl implements IOrganizationService 
{
    @Autowired
    private OrganizationMapper organizationMapper;

    /**
     * 查询机构
     * 
     * @param id 机构主键
     * @return 机构
     */
    @Override
    public Organization selectOrganizationById(Long id)
    {
        return organizationMapper.selectOrganizationById(id);
    }

    /**
     * 查询机构列表
     * 
     * @param organization 机构
     * @return 机构
     */
    @Override
    public List<Organization> selectOrganizationList(Organization organization)
    {
        return organizationMapper.selectOrganizationList(organization);
    }

    /**
     * 新增机构
     * 
     * @param organization 机构
     * @return 结果
     */
    @Override
    public int insertOrganization(Organization organization)
    {
        organization.setCreateTime(DateUtils.getNowDate());
        return organizationMapper.insertOrganization(organization);
    }

    /**
     * 修改机构
     * 
     * @param organization 机构
     * @return 结果
     */
    @Override
    public int updateOrganization(Organization organization)
    {
        organization.setUpdateTime(DateUtils.getNowDate());
        return organizationMapper.updateOrganization(organization);
    }

    /**
     * 批量删除机构
     * 
     * @param ids 需要删除的机构主键
     * @return 结果
     */
    @Override
    public int deleteOrganizationByIds(Long[] ids)
    {
        return organizationMapper.deleteOrganizationByIds(ids);
    }

    /**
     * 删除机构信息
     * 
     * @param id 机构主键
     * @return 结果
     */
    @Override
    public int deleteOrganizationById(Long id)
    {
        return organizationMapper.deleteOrganizationById(id);
    }
}
