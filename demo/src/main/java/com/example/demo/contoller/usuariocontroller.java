package com.example.demo.contoller;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.UsuarioService;

@RestController
@RequestMapping("/api/usuarios")
public class usuariocontroller {
    @Autowired
    private UsuarioService usuarioService;
    @GetMapping
    public List<com.example.demo.model.Usuario>getAllUsuarios(){
        return usuarioService.getAllUsuarios();
    }
    @GetMapping ("/{id}")
    public ResponseEntity <com.example.demo.model.Usuario>getUsuarioByld(@PathVariable Long id){
        Optional<com.example.demo.model.Usuario> usuario = usuarioService.getUsuarioById(id);
        return usuario.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }
    @PostMapping
    public ResponseEntity <com.example.demo.model.Usuario> createUsuario(@RequestBody com.example.demo.model.Usuario usuario){
        com.example.demo.model.Usuario newUsuario = usuarioService.saveUsuario(usuario);
        return new ResponseEntity<>(newUsuario,HttpStatus.CREATED);
    }
    @DeleteMapping ("/{id}")
    public ResponseEntity<Void> deleteUsuario(@PathVariable Long id){
        usuarioService.deleteUsuario(id);
        return ResponseEntity.noContent().build();
    }
}
