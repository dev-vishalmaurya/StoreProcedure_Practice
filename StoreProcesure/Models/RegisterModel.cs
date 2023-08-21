using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreProcesure.Models
{
    public class RegisterModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public long Mobile { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Qualification { get; set; }
        public string gender { get; set; }
        public string Address { get; set; }



    }
}