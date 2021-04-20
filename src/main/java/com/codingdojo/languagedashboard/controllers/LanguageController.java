package com.codingdojo.languagedashboard.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.languagedashboard.models.Language;
import com.codingdojo.languagedashboard.services.LanguageService;

@Controller
@RequestMapping("/languages")
public class LanguageController {
		private final LanguageService languageService;
		
		public LanguageController(LanguageService languageService) {
			this.languageService = languageService;
		}
		
		@RequestMapping("")
		public String languages(Model model) {
			List<Language> langs = languageService.allLanguages();
			model.addAttribute("languages", langs);
			return "lang.jsp";
		}
		
		@RequestMapping(value="/create", method=RequestMethod.POST)
		public String createLanguage(@Valid @ModelAttribute("language") Language language, BindingResult result) {
			if(result.hasErrors()) {
				return "lang.jsp";
			}
			else {
				languageService.createLanguage(language);
				return "redirect:/languages";
			}
		}
		
		@RequestMapping(value="/{id}", method=RequestMethod.GET)
		public String displayLanguage(Model model, @PathVariable("id") Long id) {
			Language lang = languageService.findLanguage(id);
			model.addAttribute("language", lang);
			return "displayLang.jsp";
		}
		
		@RequestMapping("/{id}/edit")
		public String editLanguage(@PathVariable("id") Long id, Model model) {
			Language lang = languageService.findLanguage(id);
			model.addAttribute("language", lang);
			return "editLang.jsp";
		}
		
		@RequestMapping(value="/{id}/update", method=RequestMethod.POST)
		public String update(@Valid @ModelAttribute("language") Language lang, BindingResult result) {
			if(result.hasErrors()) {
				return "editLang.jsp";
			}
			else {
				languageService.updateLanguage(lang);
				return "redirect:/languages";
			}
		}
		
		@RequestMapping("/{id}/delete")
		public String delete(@PathVariable("id") Long id) {
			languageService.deleteLanguage(id);
			return "redirect:/languages";
		}
}
