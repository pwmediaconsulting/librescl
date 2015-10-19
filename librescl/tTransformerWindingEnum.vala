/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2015 Daniel Espinosa
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

public class Lscl.tPredefinedTransformerWinding : Lscl.BaseEnum
{
	construct {
		_enumtype = typeof (tPredefinedTransformerWinding.Enum);
	}
	public tPredefinedTransformerWinding (string name)
	{
		_name = name;
	}
  public tPredefinedTransformerWinding.Enum get_value () throws GLib.Error { return (tPredefinedTransformerWinding.Enum) to_integer (); }
  public void set_value (tPredefinedTransformerWinding.Enum val) throws GLib.Error { parse_integer ((int) val); }
	public enum Enum 
	{
		PTW
	}
}