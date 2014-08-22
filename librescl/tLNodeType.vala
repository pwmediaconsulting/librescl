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
namespace Lscl
{
  public class tLNodeType : tIDNaming, SerializableMapKey<string>, SerializableMapDualKey<string,string>
  {
    [Description (blurb="Data Objects as Properties in this Logical Node Type")]
    public tDO.Collection dos { get; set; }
    [Description (nick="iedType", blurb="Data Objects as Properties in this Logical Node Type")]
    public string ied_type { get; set; default=Defaults.IED_TYPE; }
    [Description (nick="lnClass", blurb="Logical Node Class. Standard or custome one")]
    public string ln_class { get; set; }

    public tLNodeType.full (string iedtype, string lnclass, string id)
    {
      base.from_string (id);
      ln_class = lnclass;
      ied_type = iedtype;
    }
    // SerializableMapKey
    public string get_map_key () { return id; }
    // SerializableMapDualKey
    public string get_map_primary_key () { return ied_type; }
    public string get_map_secondary_key () { return id; }

    // Serializable
    public override void init_containers ()
    {
      if (dos == null)
        dos = new tDO.Collection ();
    }
    public class Collection : SerializableTreeMap<string,tLNodeType> {}
  }
}

