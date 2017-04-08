/**
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *       PowerMedia Consulting <pwmediaconsulting@gmail.com>
 *
 *
 *  Copyright (c) 2013, 2014, 2017 Daniel Espinosa
 *  Copyright (c) 2014 PowerMedia Consulting
 *  
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 3 of the License, or (at your option) any later version.
 *  
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *  
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace Lscl
{
  public class Scl : tBaseElement
  {
    [Description (nick="Header", blurb="History information about changes")]
    public tHeader header { get; set; }
    [Description (nick="Substation",
                  blurb="Substation configuration and nodes association")]
    public tSubstation substation { get; set; }
    [Description (nick="Communication",
                  blurb="Subneworks and communications descriptions")]
    public tCommunication communication { get; set; }
    [Description (blurb="IEDs defined in this configuration file")]
    public tIED.HashMap ieds { get; set; default = new tIED.HashMap (); }
    [Description (nick="DataTypeTemplates", blurb="Templates")]
    public tDataTypeTemplates data_type_templates { get; set; }

    construct {
      try {
        initialize_with_namespace ("http://www.iec.ch/61850/2003/SCL", "scl", "SCL");
        set_attribute_ns ("http://www.w3.org/2000/xmlns","xmlns:Lscl","http://www.librescl.org/SCL");
      } catch (GLib.Error e)  { warning ("Error: "+e.message); }
    }

   public new string to_string ()
   {
     string str = "SCL File:\n";
     if (header != null)
       str += "Version: " + header.version + "\n"
       + "Revision: " + header.revision + "\n";
     if (communication != null) {
       if (communication.subnetworks != null)
         str += "Subnetworks: "+ communication.subnetworks.size.to_string () + "\n";
     }
     if (ieds != null)
       str += "Total IED number: " + ieds.size.to_string () + "\n";
     if (data_type_templates != null) {
       if (data_type_templates.logical_node_types != null)
         str += "Total LN Types: " + data_type_templates.logical_node_types.size.to_string ()
         + "\n";
       if (data_type_templates.data_object_types != null)
         str += "Total DO Types: " + data_type_templates.data_object_types.size.to_string ()
         + "\n";
       if (data_type_templates.data_attribute_types != null)
         str += "Total DA Types: " + data_type_templates.data_attribute_types.size.to_string ()
         + "\n";
       if (data_type_templates.enum_types != null)
         str += "Total Enum Types: " + data_type_templates.enum_types.size.to_string ()
         + "\n";
     }
     return str;
   }
  }
}
