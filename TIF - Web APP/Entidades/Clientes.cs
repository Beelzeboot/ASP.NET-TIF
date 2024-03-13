using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Clientes
    {
        private int Legajo_Cliente;
        private string  Nombre;
        private string Contraseña;
        private string Dirección;
        private string Teléfono;
        private string Correo;
        private DateTime Fecha_nacimiento;
        private bool Estado;





        public Clientes() { }

        public int Legajo_Cliente1 { get => Legajo_Cliente; set => Legajo_Cliente = value; }
        public string Nombre1 { get => Nombre; set => Nombre = value; }
        public string Contraseña1 { get => Contraseña; set => Contraseña = value; }
        public string Dirección1 { get => Dirección; set => Dirección = value; }
        public string Teléfono1 { get => Teléfono; set => Teléfono = value; }
        public string Correo1 { get => Correo; set => Correo = value; }
        public DateTime Fecha_nacimiento1 { get => Fecha_nacimiento; set => Fecha_nacimiento = value; }
        public bool Estado1 { get => Estado; set => Estado = value; }
    }
}