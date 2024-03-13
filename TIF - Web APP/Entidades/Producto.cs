using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Producto
    {
        private int Legajo_Producto;
        private string Nombre;
        private decimal Precio;
        private string Descripcion;
        private bool Estado;

        public Producto() { }

        public int Legajo_Producto1 { get => Legajo_Producto; set => Legajo_Producto = value; }
        public string Nombre1 { get => Nombre; set => Nombre = value; }
        public decimal Precio1 { get => Precio; set => Precio = value; }
        public string Descripcion1 { get => Descripcion; set => Descripcion = value; }
        public bool Estado1 { get => Estado; set => Estado = value; }
    }
}
