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
        return mav;
    }
 @RequestMapping(value="/newimage",method = RequestMethod.POST)
 public String handleFileUpload(HttpServletRequest request,
								@RequestParam CommonsMultipartFile[] fileOfImage) throws Exception 
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

        return "redirect:/site/main/adminservice";
    }
	
	
	@RequestMapping(value="/newsliderimage",method = RequestMethod.POST)
 public String handleFileUploadSlider(HttpServletRequest request,
								@RequestParam CommonsMultipartFile[] fileOfImage) throws Exception 
	{	
		_sliderDAO.addSliderImage(fileOfImage[0].getOriginalFilename(),"img/"+ fileOfImage[0].getOriginalFilename());

        if (fileOfImage != null && fileOfImage.length > 0) {
            for (CommonsMultipartFile aFile : fileOfImage){
                 
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                 
                if (!aFile.getOriginalFilename().equals("")) {
                    aFile.transferTo(new File(request.getRealPath("/img/") +"/"+ aFile.getOriginalFilename()));
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
		_sectionDAO.addSection(name,"img/"+ fileOfImage[0].getOriginalFilename());
        if (fileOfImage != null && fileOfImage.length > 0) {
            for (CommonsMultipartFile aFile : fileOfImage){
                 
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                 
                if (!aFile.getOriginalFilename().equals("")) {
                    aFile.transferTo(new File(request.getRealPath("/img/") +"/"+ aFile.getOriginalFilename()));
                }
            }
        }

        return "redirect:/site/main/adminservice";
    }
	
	@RequestMapping(value="/newgroup",method = RequestMethod.POST)
 public String uploadGroup(HttpServletRequest request) throws Exception 
	{	
		String name=request.getParameter("name");
		_groupDAO.addGroup(name);
        return "redirect:/site/main/adminservice";
    }
}