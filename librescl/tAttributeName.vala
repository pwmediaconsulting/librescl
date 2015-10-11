/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* SerializableValueList.vala
 *
 * Copyright (C) 2015  Daniel Espinosa <esodan@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *      Daniel Espinosa <esodan@gmail.com>
*/
using GXml;

public class Lscl.tAttributeName : BaseValueList
{
   public tAttributeName (string name)
   {
     base (name);
     add_values ({"T", "Test", "Check", "SIUnit", "Oper", "SBO", "SBOw", "Cancel", "ctlVal",
 "operTm", "origin", "ctlNum", "stVal", "q", "t", "stSeld", "subEna", "subVal",
 "subQ", "subID", "ctlModel","sboTimeout","sboClass","minVal", "maxVal",
 "stepSize","d","dU","cdcNs","cdcName","dataNs"});
   }
}