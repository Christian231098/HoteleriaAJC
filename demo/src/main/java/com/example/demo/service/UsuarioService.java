package com.example.demo.service;
import java.util.List;
import java.util.Optional;

//imporytamos las anotaciones necesarias de spring
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//importamos la clase Usuario que representa la entidad
import com.example.demo.model.Usuario;
//importamos el repositorio UusarioRepository que interactúacon las base de datos
import com.example.demo.repository.UsuarioRepository;
//anotamos la clase como un servicio de spring
@Service
public class UsuarioService {
    //injetamos el repositorio  UsuarioRepository
    @Autowired
    //metodo para obtener todos los usuarios
    private UsuarioRepository usuarioRepository;
    //metodo para obetner todos los usuarios
    public List<Usuario> getAllUsuarios(){
        //utiliza el repositorio para encontrar y devolver todos los usuarios
        return usuarioRepository.findAll();
    }
    // metodo para obtener todos los usuarios por su ID
    public Optional<Usuario> getUsuarioById(Long id){
        //utiliza el repositorio para encontrar y devolver el usuario con el id especificado
        return usuarioRepository.findById(id);
    }
    //metodo para guardar un nuevo Usuario o Actualizar uno existente
    public Usuario saveUsuario(Usuario usuario){
        //utiliza el repositorio para guardar el usuario
        return usuarioRepository.save(usuario);
    }
    public void deleteUsuario(Long id){
        usuarioRepository.deleteById(id);
    }
}
