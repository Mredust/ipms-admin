package com.ruoyi.ipms.service;

import java.util.List;
import com.ruoyi.ipms.domain.Organization;

/**
 * 机构Service接口
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public interface IOrganizationService 
{
    /**
     * 查询机构
     * 
     * @param id 机构主键
     * @return 机构
     */
    public Organization selectOrganizationById(Long id);

    /**
     * 查询机构列表
     * 
     * @param organization 机构
     * @return 机构集合
     */
    public List<Organization> selectOrganizationList(Organization organization);

    /**
     * 新增机构
     * 
     * @param organization 机构
     * @return 结果
     */
    public int insertOrganization(Organization organization);

    /**
     * 修改机构
     * 
     * @param organization 机构
     * @return 结果
     */
    public int updateOrganization(Organization organization);

    /**
     * 批量删除机构
     * 
     * @param ids 需要删除的机构主键集合
     * @return 结果
     */
    public int deleteOrganizationByIds(Long[] ids);

    /**
     * 删除机构信息
     * 
     * @param id 机构主键
     * @return 结果
     */
    public int deleteOrganizationById(Long id);
}
