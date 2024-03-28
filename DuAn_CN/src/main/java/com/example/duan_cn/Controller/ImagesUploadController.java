package com.example.duan_cn.Controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ImagesUploadController {
  @RequestMapping(value = "getimage/{anhsanPham}", method = RequestMethod.GET)
  @ResponseBody
  public ResponseEntity<ByteArrayResource> getImage(@PathVariable("anhsanPham") String photo
      ,@PathVariable("anhsanPham") String maSP) {
    if (!photo.equals("") || photo != null) {
      try {
        Path path=Paths.get("src/main/resources/static/Images/"+photo);
        System.out.println(path+"đọc ảnh ở đây");
        System.out.println(path.toFile().getAbsolutePath());
        byte[] buffer = Files.readAllBytes(path);
        ByteArrayResource byteArrayResource = new ByteArrayResource(buffer);
        return ResponseEntity.ok()
            .contentLength(buffer.length)
            .contentType(MediaType.parseMediaType("image/png"))
            .body(byteArrayResource);
      } catch (Exception e) {
        e.printStackTrace();
      }
      return ResponseEntity.badRequest().build();
    }
    System.out.println("lỗi rồi cu");
    return null;
  }

}
