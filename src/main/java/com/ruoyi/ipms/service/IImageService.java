package com.ruoyi.ipms.service;

import java.util.List;
import com.ruoyi.ipms.domain.Image;

/**
 * 图片Service接口
 * 
 * @author Mredust
 * @date 2026-02-06
 */
public interface IImageService 
{
    /**
     * 查询图片
     * 
     * @param id 图片主键
     * @return 图片
     */
    public Image selectImageById(Long id);

    /**
     * 查询图片列表
     * 
     * @param image 图片
     * @return 图片集合
     */
    public List<Image> selectImageList(Image image);

    /**
     * 新增图片
     * 
     * @param image 图片
     * @return 结果
     */
    public int insertImage(Image image);

    /**
     * 修改图片
     * 
     * @param image 图片
     * @return 结果
     */
    public int updateImage(Image image);

    /**
     * 批量删除图片
     * 
     * @param ids 需要删除的图片主键集合
     * @return 结果
     */
    public int deleteImageByIds(Long[] ids);

    /**
     * 删除图片信息
     * 
     * @param id 图片主键
     * @return 结果
     */
    public int deleteImageById(Long id);
}
