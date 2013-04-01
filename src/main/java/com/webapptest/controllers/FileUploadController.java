package com.webapptest.controllers;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.ModelAndView;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.webapptest.model.dao.GroupDAO;
import com.webapptest.model.dao.ImageDAO;
import com.webapptest.model.dao.SliderimageDAO;
import com.webapptest.model.dao.SectionDAO;
import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import com.webapptest.model.entity.Group;
import com.webapptest.model.entity.Section;
import com.webapptest.model.entity.Image;
import com.webapptest.model.entity.Sliderimage;
import java.util.ArrayList;
@Controller
@RequestMapping(value = "/main/adminservice")
public class FileUploadController extends SimpleFormController {

Logger _logger = Logger.getLogger(FileUploadController.class);
//private String saveDirectory = "I:\WebApp";
	@Autowired
    ImageDAO _imageDAO;
	@Autowired
    SliderimageDAO _sliderDAO;
	@Autowired
    GroupDAO _groupDAO;
	@Autowired
    SectionDAO _sectionDAO;

@RequestMapping(method = RequestMethod.GET)
    public ModelAndView getAdminService() {
        ModelAndView mav = new ModelAndView("adminservice");
        mav.addObject("sections", _sectionDAO.findAll());
		mav.addObject("groups", _groupDAO.findAll());
		mav.addObject("images", _imageDAO.findAll());
		mav.addObject("sliders", _sliderDAO.findAll());

        return mav;
    }
 @RequestMapping(value="/newimage",method = RequestMethod.POST)
 public String handleFileUpload(HttpServletRequest request,
								@RequestParam CommonsMultipartFile[] fileOfImage) throws Exception 
	{
        if(_imageDAO.findByName(fileOfImage[0].getOriginalFilename())==null)
		{
			String group=request.getParameter("idOfGroup");
			String section=request.getParameter("idOfSection");
			_imageDAO.addImage(fileOfImage[0].getOriginalFilename(),"img/"+ fileOfImage[0].getOriginalFilename(),Integer.parseInt(group),Integer.parseInt(section));

			if (fileOfImage != null && fileOfImage.length > 0) {
				for (CommonsMultipartFile aFile : fileOfImage){
					 
					System.out.println("Saving file: " + aFile.getOriginalFilename());
					 
					if (!aFile.getOriginalFilename().equals("")) {
						aFile.transferTo(new File(request.getRealPath("/img/") +"/"+ aFile.getOriginalFilename()));
					}
				}
			}
		}

        return "redirect:/site/main/adminservice";
    }
	
	
	@RequestMapping(value="/newsliderimage",method = RequestMethod.POST)
 public String handleFileUploadSlider(HttpServletRequest request,
								@RequestParam CommonsMultipartFile[] fileOfImage) throws Exception 
	{	
		_sliderDAO.addSliderImage(fileOfImage[0].getOriginalFilename(),"img/slider/"+ fileOfImage[0].getOriginalFilename());

        if (fileOfImage != null && fileOfImage.length > 0) {
            for (CommonsMultipartFile aFile : fileOfImage){
                 
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                 
                if (!aFile.getOriginalFilename().equals("")) {
                    aFile.transferTo(new File(request.getRealPath("/img/slider/") +"/"+ aFile.getOriginalFilename()));
                }
            }
        }

        return "redirect:/site/main/adminservice";
    }
	
	@RequestMapping(value="/newsection",method = RequestMethod.POST)
 public String handleFileUploadSection(HttpServletRequest request,
								@RequestParam CommonsMultipartFile[] fileOfImage) throws Exception 
	{	
		String name=request.getParameter("name");
		if(_sectionDAO.findByName(name)==null)
		{
			Section newSection=new Section(name,"img/section/"+ fileOfImage[0].getOriginalFilename());
			_sectionDAO.addSection(newSection);
			if (fileOfImage != null && fileOfImage.length > 0) {
				for (CommonsMultipartFile aFile : fileOfImage){
					 
					System.out.println("Saving file: " + aFile.getOriginalFilename());
					 
					if (!aFile.getOriginalFilename().equals("")) {
						aFile.transferTo(new File(request.getRealPath("/img/section/") +"/"+ aFile.getOriginalFilename()));
					}
				}
			}
		}
        return "redirect:/site/main/adminservice";
    }
	
	@RequestMapping(value="/newgroup",method = RequestMethod.POST)
 public String uploadGroup(HttpServletRequest request) throws Exception 
	{	
		String name=request.getParameter("name");
		if(_groupDAO.findByName(name)==null)
		{
			Group newGroup=new Group(name);
			_groupDAO.addGroup(newGroup);
		}
        return "redirect:/site/main/adminservice";
    }
	
	@RequestMapping(value = "/delgroup", method = RequestMethod.GET)
    public String deleteGroup(HttpServletRequest request) {
	String name=request.getParameter("delGroup");
	if(name!="withoutgroup")
	{ArrayList<Image> images=(ArrayList<Image>)_imageDAO.findByNameOfGroup(name);
		for(Image image:images)
			_imageDAO.updateGroup(image);
		_logger.info("request for delete group with name = " + name);
		_groupDAO.delete(name);
	}
        return "redirect:/site/main/adminservice";
    }
	@RequestMapping(value = "/delsection", method = RequestMethod.GET)
    public String deleteSection(HttpServletRequest request) {
		String name=request.getParameter("delSection");
		ArrayList<Image> images=(ArrayList<Image>)_imageDAO.findByNameOfSection(name);
		Section delSection=_sectionDAO.findByName(name);
		for(Image image:images)
			{
				_imageDAO.delete(image.getName());
				_logger.info("request for delete image with name = " + request.getRealPath(image.getPathToFile()));
				File deleteFile=new File(request.getRealPath(image.getPathToFile()));
				if(deleteFile.exists())
					deleteFile.delete();

			}
			File deleteFile=new File(request.getRealPath(delSection.getPathToFile()));
				if(deleteFile.exists())
					deleteFile.delete();
        _logger.info("request for delete section with name = " + name);
        _sectionDAO.delete(name);
        return "redirect:/site/main/adminservice";
    }
	@RequestMapping(value = "/delsliderimg", method = RequestMethod.GET)
    public String deleteSliderImg(HttpServletRequest request)  {
		String name=request.getParameter("delSlider");
		Sliderimage delSliderImg=_sliderDAO.findByName(name);
        _logger.info("request for delete sligerImg with name = " + request.getRealPath(delSliderImg.getPathToFile()));
		File deleteFile=new File(request.getRealPath(delSliderImg.getPathToFile()));
		if(deleteFile.exists())
		deleteFile.delete();	
        _sliderDAO.delete(name);
        return "redirect:/site/main/adminservice";
    }
	@RequestMapping(value = "/delimg", method = RequestMethod.GET)
    public String deleteImg(HttpServletRequest request) {
		String name=request.getParameter("delImg");
        
		Image delImage=_imageDAO.findByName(name);
		_logger.info("request for delete img with name = " + request.getRealPath(delImage.getPathToFile()));
		File deleteFile=new File(request.getRealPath(delImage.getPathToFile()));
		if(deleteFile.exists())
		deleteFile.delete();
        _imageDAO.delete(name);
        return "redirect:/site/main/adminservice";
    }
	


	
}