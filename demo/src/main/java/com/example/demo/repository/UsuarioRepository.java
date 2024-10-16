package com.example.demo.repository;
// importamos la clase del usuario que reperesentara la entidad
//importamos la interfaz JPACRUD
//importamos la clase Usuario que representa la entidad
import com.example.demo.model.Usuario;
//importamos la interfaz JpaRepository que nos proporciona metodos CRUD estandar
import org.springframework.data.jpa.repository.JpaRepository;
//importamos la anotacion Repository que indica que esa interfaz es un repositorio 
import org.springframework.stereotype.Repository;
//indicamos que esta interfaz es un repositorio como la @
@Repository
//definimos la interfaz UsuarioRepository que extiende JpaRepository
//JpaRepository <T,ID> toma dos parametros: la entidad y el tipo de la clave primaria 
public interface UsuarioRepository  extends JpaRepository<Usuario,Long>{
//JpaRepository ya proporciona metodos crud basicos  como save,finID,findAll,deleById,etc
//podemos agregar metodos personalizados si es necesario
//nota: tenemos que crearlo en el orden en el que los estamos realizando.
    
}