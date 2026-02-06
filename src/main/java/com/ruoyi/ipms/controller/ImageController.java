package com.ruoyi.ipms.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.ipms.domain.Image;
import com.ruoyi.ipms.service.IImageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 图片Controller
 * 
 * @author Mredust
 * @date 2026-02-06
 */
@RestController
@RequestMapping("/ipms/image")
public class ImageController extends BaseController
{
    @Autowired
    private IImageService imageService;

    /**
     * 查询图片列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:image:list')")
    @GetMapping("/list")
    public TableDataInfo list(Image image)
    {
        startPage();
        List<Image> list = imageService.selectImageList(image);
        return getDataTable(list);
    }

    /**
     * 导出图片列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:image:export')")
    @Log(title = "图片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Image image)
    {
        List<Image> list = imageService.selectImageList(image);
        ExcelUtil<Image> util = new ExcelUtil<Image>(Image.class);
        util.exportExcel(response, list, "图片数据");
    }

    /**
     * 获取图片详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:image:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(imageService.selectImageById(id));
    }

    /**
     * 新增图片
     */
    @PreAuthorize("@ss.hasPermi('ipms:image:add')")
    @Log(title = "图片", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Image image)
    {
        return toAjax(imageService.insertImage(image));
    }

    /**
     * 修改图片
     */
    @PreAuthorize("@ss.hasPermi('ipms:image:edit')")
    @Log(title = "图片", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Image image)
    {
        return toAjax(imageService.updateImage(image));
    }

    /**
     * 删除图片
     */
    @PreAuthorize("@ss.hasPermi('ipms:image:remove')")
    @Log(title = "图片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(imageService.deleteImageByIds(ids));
    }
}
