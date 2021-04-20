package com.codingdojo.languagedashboard.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.languagedashboard.models.Language;
import com.codingdojo.languagedashboard.repositories.LanguageRepository;


@Service
public class LanguageService {
	private final LanguageRepository languageRepository;
	
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
	
	public List<Language> allLanguages(){
		return languageRepository.findAll();
	}
	
	public Language createLanguage(Language lang) {
		return languageRepository.save(lang);
	}
	
	public Language findLanguage(Long id) {
		Optional<Language> optionalLang = languageRepository.findById(id);
		if(optionalLang.isPresent()) {
			return optionalLang.get();
		}
		else {
			return null;
		}
	}
	
	public void deleteLanguage(Long id) {
		Language lang = findLanguage(id);
		languageRepository.delete(lang);
	}
	
	public Language updateLanguage(Language lang) {
		return languageRepository.save(lang);
	}
}
