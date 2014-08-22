/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *       PowerMedia Consulting <pwmediaconsulting@gmail.com>
 *
 *
 *  Copyright (c) 2013, 2014 Daniel Espinosa
 *  Copyright (c) 2014 PowerMedia Consulting
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GXml;
using Gee;

namespace Lscl
{
	
   /**
    * LSCL_EDITION:
    * 
    * Holds actual version used to generate SCL compliant files.
    * 
    * Generate Edition 2.0 compliant files are considered incomplete.
    * You can read and write Edition 2.0 files, but some attributes could
    * not be available on actual API.
    */
    public enum Edition {
	    FIRST,
	    SECOND
    }
    public class Serializable : GXml.SerializableContainer
    {
    protected Edition _edition;
    /**
     * Add elements to this property in order to mark any property
     * as present just on a defined version. Use property's canonical 
     * name as collection value and edition number it belongs to.
     * 
     * To set a property 'trg_ops' as a second edition property use
     * 'trg-ops' as value and a Lscl.Edition.SECOND as key.
     * 
     * See at Lscl.Edition enum for supported editions.
     * 
     */
	  protected Gee.HashMultiMap<string,Edition> _property_edition;
    /**
     * 
     */
    public void set_edition (Edition edition) {
	    if (edition == Edition.FIRST) _edition = edition;
	    if (edition == Edition.SECOND) _edition = edition;
    }
    public Edition get_edition () {
      return _edition;
    }

    construct {
      Init.init ();
    }

    public Serializable () {
      _edition = Edition.FIRST;
      _property_edition = new Gee.HashMultiMap<string,Edition> ();
    }

    public override GXml.Node? serialize_property (GXml.Element element,
                                                   GLib.ParamSpec prop)
        throws GLib.Error
    {
      if (_edition != Edition.FIRST &&
          _property_edition.size != 0) // FIXME: This doesn't work on SECOND edition
        if (_property_edition.get (prop.name) != null) return element;
      return default_serialize_property (element, prop);
    }

    public override string node_name ()
    {
      string nname = get_type ().name ();
      if ("Lsclt" in nname)
        nname = nname.replace ("Lsclt","");
      else {
        if ("Lscl" in nname)
          nname = nname.replace ("Lscl","");
      }
      return nname;
    }
    public override bool property_use_nick () { return true; }
    public override string to_string ()
    {
      Document doc = new Document ();
      string ret = this.get_type ().name ();
      try {
        this.serialize (doc);
        ret = @"%s".printf (doc.to_string ());
      }
      catch (GLib.Error e) {
        ret = @"ERROR: to_string (): $(e.message)";
      }
      return ret;
    }
    public virtual string get_id ()
    {
      return get_type ().name ();
    }
    public override void init_containers ()
    {
      return;
    }
    // Implementation of AnyContentFromOtherNameSpace
    public new virtual bool get_enable_unknown_serializable_property () { return true; }
    public Gee.ArrayList<Object> find_other (string name)
    {
      var objs = new Gee.ArrayList<Object> ();
      foreach (GXml.Node n in unknown_serializable_property.get_values ()) {
        if (n.node_name == name) {
          if (n is GXml.Attr) {
            var attr = new OtherProperty (n);
            objs.add (attr);
          }
          if (n is GXml.Element) {
            var elm = new OtherElement (n);
            objs.add (elm);
          }
        }
      }
      return objs;
    }
    public class OtherProperty : Object
    {
      protected GXml.Node node;
      public string name { get { return node.node_name; } }
      public string @value { get { return node.node_value; } }
      public OtherProperty (GXml.Node attr)
      {
        this.node = attr;
      }
    }
    public class OtherElement : Object
    {
      private GXml.Node node;
      public string name { get { return node.node_name; } } 
      public OtherElement (GXml.Node node)
      {
        this.node = node;
      }
    }
  }
}

