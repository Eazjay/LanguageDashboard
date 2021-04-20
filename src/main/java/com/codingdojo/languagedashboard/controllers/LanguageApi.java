package com.codingdojo.languagedashboard.controllers;

import java.util.List;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.languagedashboard.models.Language;
import com.codingdojo.languagedashboard.services.LanguageService;


@RestController
public class LanguageApi {
	private final LanguageService languageService;
	
	public LanguageApi(LanguageService languageService) {
		this.languageService = languageService;
	}
	
	@RequestMapping("/api/languages")
	public List<Language> index(){
		return languageService.allLanguages();
	}
	
	@RequestMapping(value="/api/languages/create", method=RequestMethod.POST)
	public Language create(@RequestParam(value="name") String name,
						@RequestParam(value="creator") String creator,
						@RequestParam(value="version") Integer version) {
		Language lang = new Language(name, creator, version);
		return languageService.createLanguage(lang);
	}
	
	@RequestMapping("/api/languages/{id}")
	public Language show(@PathVariable("id") Long id) {
		Language lang = languageService.findLanguage(id);
		return lang;
	}
	
	@RequestMapping("/api/languages/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "Language deleted successfully";
	}
	
	@RequestMapping(value="/api/languages/{id}/update", method=RequestMethod.PUT)
	public Language update(@RequestParam(value="name") String name,
						@RequestParam(value="creator") String creator,
						@RequestParam(value="version") Integer version,
						@PathVariable("id") Long id) {
		Language lang = languageService.findLanguage(id);
		lang.setName(name);
		lang.setCreator(creator);
		lang.setVersion(version);
		return languageService.updateLanguage(lang);
	}
}
