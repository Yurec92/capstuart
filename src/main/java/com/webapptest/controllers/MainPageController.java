package com.webapptest.controllers;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import com.webapptest.model.dao.GroupDAO;

import com.webapptest.model.dao.ImageDAO;
import com.webapptest.model.dao.SliderimageDAO;
import com.webapptest.model.dao.SectionDAO;
import com.webapptest.model.entity.Image;


@Controller
@RequestMapping(value = "/main")
public class MainPageController {
    Logger _logger = Logger.getLogger(MainPageController.class);


    @Autowired
    GroupDAO _groupDAO;
	
	@Autowired
    SectionDAO _sectionDAO;
	@Autowired
    ImageDAO _imageDAO;
	@Autowired
    SliderimageDAO _sliderDAO;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getMainPage() 
	{	
        ModelAndView mav = new ModelAndView("main");
		mav.addObject("sections",_sectionDAO.findAll());
		mav.addObject("photos", _imageDAO.findAll());
		mav.addObject("slider", _sliderDAO.findAll());
        return mav;
    }
    @RequestMapping(value = "/section/{name}", method = RequestMethod.GET)
    public ModelAndView getSection(@PathVariable("name") String name) {
        ModelAndView mav = new ModelAndView("section");
        mav.addObject("sectionPhotos", _imageDAO.findByNameOfSection(name));
		mav.addObject("section", _sectionDAO.findByName(name));
		mav.addObject("groups", _groupDAO.findAll());
        return mav;
    }
	@RequestMapping(value = "/group/{name}", method = RequestMethod.GET)
    public ModelAndView getGroup(@PathVariable("name") String name) {
        ModelAndView mav = new ModelAndView("group");
        mav.addObject("groupPhotos", _imageDAO.findByNameOfGroup(name));
		mav.addObject("group", _groupDAO.findByName(name));
		mav.addObject("groups", _groupDAO.findAll());
        return mav;
    }
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
    public ModelAndView getGallery() {
        ModelAndView mav = new ModelAndView("gallery");
        mav.addObject("photos", _imageDAO.findAll());
		mav.addObject("groups", _groupDAO.findAll());
        return mav;
    }
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
    public ModelAndView getContact() {
        ModelAndView mav = new ModelAndView("contact");
        return mav;
    }


}
