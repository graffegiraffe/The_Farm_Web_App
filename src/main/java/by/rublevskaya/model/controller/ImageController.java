package by.rublevskaya.model.controller;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ImageController {

    @GetMapping("/static/background.jpg")
    public ResponseEntity<Resource> serveBackgroundImage() {
        return serveImage("static/background.jpg");
    }

    @GetMapping("/static/cow_menu.jpg")
    public ResponseEntity<Resource> serveCowMenuImage() {
        return serveImage("static/cow_menu.jpg");
    }

    @GetMapping("/static/fon_cow.jpg")
    public ResponseEntity<Resource> serveCowFonImage() {
        return serveImage("static/fon_cow.jpg");
    }

    @GetMapping("/static/danceCow.mp4") // Новый метод для видео
    public ResponseEntity<Resource> serveVideo() {
        Resource resource = new ClassPathResource("static/danceCow.mp4");
        if (!resource.exists()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "video/mp4");
        return new ResponseEntity<>(resource, headers, HttpStatus.OK);
    }

    private ResponseEntity<Resource> serveImage(String path) {
        Resource resource = new ClassPathResource(path);
        if (!resource.exists()) {
            return ResponseEntity.notFound().build();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "image/jpeg");
        return new ResponseEntity<>(resource, headers, HttpStatus.OK);
    }
}