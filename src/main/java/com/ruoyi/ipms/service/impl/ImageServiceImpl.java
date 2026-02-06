package com.ruoyi.ipms.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.ImageMapper;
import com.ruoyi.ipms.domain.Image;
import com.ruoyi.ipms.service.IImageService;

/**
 * 图片Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-06
 */
@Service
public class ImageServiceImpl implements IImageService 
{
    @Autowired
    private ImageMapper imageMapper;

    /**
     * 查询图片
     * 
     * @param id 图片主键
     * @return 图片
     */
    @Override
    public Image selectImageById(Long id)
    {
        return imageMapper.selectImageById(id);
    }

    /**
     * 查询图片列表
     * 
     * @param image 图片
     * @return 图片
     */
    @Override
    public List<Image> selectImageList(Image image)
    {
        return imageMapper.selectImageList(image);
    }

    /**
     * 新增图片
     * 
     * @param image 图片
     * @return 结果
     */
    @Override
    public int insertImage(Image image)
    {
        image.setCreateTime(DateUtils.getNowDate());
        return imageMapper.insertImage(image);
    }

    /**
     * 修改图片
     * 
     * @param image 图片
     * @return 结果
     */
    @Override
    public int updateImage(Image image)
    {
        return imageMapper.updateImage(image);
    }

    /**
     * 批量删除图片
     * 
     * @param ids 需要删除的图片主键
     * @return 结果
     */
    @Override
    public int deleteImageByIds(Long[] ids)
    {
        return imageMapper.deleteImageByIds(ids);
    }

    /**
     * 删除图片信息
     * 
     * @param id 图片主键
     * @return 结果
     */
    @Override
    public int deleteImageById(Long id)
    {
        return imageMapper.deleteImageById(id);
    }
}
