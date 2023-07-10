package Practica2;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MEDAC
 */
public class Practica2 {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver"; //Nombre del driver que usaremos
    private static final String URL_CONEXION = "jdbc:mysql://localhost:3306/avrcmf";
    //Base de datos a la que nos conectaremos
    
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        boolean salir = false;
        int opcion;

        while (!salir) {

            System.out.println("1. Conectar a la base de datos");
            System.out.println("2. DML");
            System.out.println("3. Consultas");
            System.out.println("4. Salir del programa");
            try {

                System.out.println("Escribe una de las opciones");
                opcion = s.nextInt();

                switch (opcion) {
                    case 1:
                        //Nos conectamos a la base de datos
                        conectar();
                        break;
                    case 2:
                        int opcion2;
                        System.out.println("1. Insertar");
                        System.out.println("2. Update");
                        System.out.println("3. Delete");
                        System.out.println("¿Qué quieres hacer?");
                        opcion2 = s.nextInt();
                        
                        switch(opcion2) {
                            case 1:
                                int opcion3;
                                System.out.println("1. Empleado");
                                System.out.println("2. Departamento");
                                System.out.println("3. Cliente");
                                System.out.println("4. Proyecto");
                                System.out.println("5. Facturación");
                                System.out.println("¿Qué quieres insertar?");
                                opcion3 = s.nextInt();
                                switch(opcion3){
                                    case 1:
                                        int id, telefono, depart;
                                        String name, apell;
                                        System.out.println("Indica la id");
                                        id = s.nextInt();
                                        System.out.println("Indica el nombre");
                                        name = s.nextLine();
                                        System.out.println("Indica el apellido");
                                        apell = s.nextLine();
                                        System.out.println("Indica el telefono");
                                        telefono = s.nextInt();
                                        System.out.println("Indica la id del departamento");
                                        depart = s.nextInt();
                                        if(depart <= 3){
                                            insertarEmple(id, name, apell, telefono, depart);
                                        } else{
                                            System.out.println("Error, introduce una id de departamento correcta");
                                            s.nextInt();
                                        }
                                        break;
                                        
                                    case 2:
                                        int idDepart;
                                        String nameDepart;
                                        System.out.println("Indica la id");
                                        idDepart = s.nextInt();
                                        System.out.println("Indica el nombre");
                                        nameDepart = s.nextLine();
                                        insertarDepart(idDepart, nameDepart);
                                        break;
                                }
                                break;
                                
                            case 2:
                                
                                break;
                            
                            case 3:
                        }
                        break;
                    case 3:
                        
                        break;
                        
                    case 4:
                        //Salimos del programa
                        salir = true;
                        break;
                    default:
                        System.out.println("Solo números entre 1 y 4");
                }
            }catch(Exception e){
                e.getMessage();
            }
        }
    }
    
    public static void conectar(){
        final String user = "root";
        final String pass = "1234";
        Connection conexion = null;
        Statement a = null;
        try {
            Class.forName(DRIVER); //Registramos el driver
            Connection conectado = DriverManager.getConnection(URL_CONEXION, user, pass);
            //DriverManager gestiona los drivers y devuelce un objeto conexión para conectarnos a la base de datos
        } catch (Exception e) {
            e.getMessage();
        }
    }
    
    
    //INSERTS
    
    
    public static void insertarEmple(int id, String name, String apell, int telefono, int department){
        String insertar = "INSERT INTO empleado VALUES(" + id + ", " + name + ", " + apell + ", " + telefono + ", " + department +");";
    }
    
    public static void insertarDepart(int id, String name){
        String insertar = "INSERT INTO departamento VALUES(" + id + ", " + name + ");";
    }
    
    public static void insertarClie(int id, String name){
        String insertar = "INSERT INTO cliente VALUES(" + id + ", " + name + ");";
    }
    
    public static void insertarProyecto(int id, String name, String lenguaje, int departId, int clientId){
        String insertar = "INSERT INTO proyecto VALUES(" + id + ", " + name + ", " + lenguaje + ", " + departId + ", " + clientId +");";
    }
    
    public static void insertarFacturas(int id, int precio, int proyectoID){
        String insertar = "INSERT INTO empleado VALUES(" + id + ", " + precio + ", sysdate(), " + proyectoID +");";
    }
    
    
    //UPDATES
    
    
    public static void updateEmple(int id, int telefono){
        String update = "Update empleado set telefono = " + telefono + " where id = " + id + ";";
    }
    
    public static void updateDepart(int id, String name){
        String update = "Update departamento set nombre = " + name + " where id = " + id + ";";
    }
    
    public static void updateClie(int id, String name){
        String update = "Update cliente set nombre = " + name + " where id = " + id + ";";
    }
    
    public static void updateProyecto(int id, String lenguaje){
        String update = "Update proyecto set lenguaje = " + lenguaje + " where id = " + id + ";";
    }
    
    public static void updateFacturas(int id, int precio){
        String update = "Update facturacion set precio = " + precio + " where id = " + id + ";";
    }
    
    
    //DELETES
    
    
    public static void deleteEmple(int id){
        String delete = "Delete empleado where id = " + id + ";";
    }
    
    public static void deleteDepart(int id){
        String delete = "Delete departamento where id = " + id + ";";
    }
    
    public static void deleteClie(int id){
        String delete = "Delete cliente where id = " + id + ";";
    }
    
    public static void deleteProyecto(int id){
        String delete = "Delete proyecto where id = " + id + ";";
    }
    
    public static void deleteFacturas(int id){
        String delete = "Delete facturacion where id = " + id + ";";
    }
    
    
}
