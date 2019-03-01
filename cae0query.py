#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  cae0query.py
#  
#  Copyright 2019 Coelodonta
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

import mysql.connector

class CauseFinder:
	db=None
	
	def indent(self,msg,n):
		for i in range(n):
			print(msg,end =" ")
			
	def close(self):
		self.db.close()
		
	def findcauses(self,entityid,qcode,n):
		sql="""select e.EntityId,e.QCode,e.QDescr,p.PDescr from Entity e 
		LEFT OUTER JOIN Triple t on e.EntityId=t.Cause 
		LEFT OUTER JOIN Property p on p.PropertyId=t.Relationship 
		where t.Effect={} and t.Relationship in (5,6,7) 
		""".format(entityid)  

		order=" order by QDescr asc"

		cursor=self.db.cursor(dictionary=True)
		cursor.execute(sql+order)
		effects=cursor.fetchall()
		cursor.close()
		for e in effects:
			self.indent("->",n)
			if e['QDescr']!="missing description":
				print("{}  (Relationship: {})".format(e['QDescr'],e['PDescr']))
			else:
				print("Entity: {} (Relationship: {})".format(e['QCode'],e['PDescr']))
			self.findcauses(e['EntityId'],e['QCode'],n+1)
		
	def query(self,words):
		# Join the list items separated by " "	
		querystr=" ".join(words)
		print("Finding Effects containing the phrase \"{}\"..".format(querystr))
		self.db=mysql.connector.connect(user='<insert user here>', password='<insert password here>',host='<insert host name here>',database='<insert database name here>')
		
		sql="""select distinct e.EntityId, e.QCode, e.QDescr 
		from Entity e , Triple t 
		where e.QDescr is not NULL and e.QDescr like '%{}%' 
		and e.EntityId=t.Effect and t.Relationship not in (5,6,7) 
		""".format(querystr)
		
		order=" order by QDescr asc"

		cursor=self.db.cursor(dictionary=True)
		cursor.execute(sql+order)
		idx=0
		causes=cursor.fetchall()
		cursor.close()
		print("       Effects:")
		for cause in causes:
			idx+=1
			if cause['QDescr']!="missing deescription":
				print("{}. {}".format(idx,cause['QDescr']))
				
		prompt="Select the Effect (1-{}):\n\n".format(idx)
		sel=int(input(prompt))
		sel-=1
		print("Causes of {}:".format(causes[sel]['QDescr']))
		self.findcauses(causes[sel]['EntityId'],causes[sel]['QCode'],1)	
		print("")
		print("")
					
class EffectFinder:
	db=None
	
	def indent(self,msg,n):
		for i in range(n):
			print(msg,end =" ")
			
	def close(self):
		self.db.close()
		
	def findeffects(self,entityid,qcode,n):
		sql="""select e.EntityId,e.QCode,e.QDescr,p.PDescr from Entity e 
		LEFT OUTER JOIN Triple t on e.EntityId=t.Effect 
		LEFT OUTER JOIN Property p on p.PropertyId=t.Relationship 
		where t.Cause={} and t.Relationship not in (5,6,7) 
		""".format(entityid)  

		order=" order by QDescr asc"

		cursor=self.db.cursor(dictionary=True)
		cursor.execute(sql+order)
		effects=cursor.fetchall()
		cursor.close()
		for e in effects:
			self.indent("->",n)
			if e['QDescr']!="missing description":
				print("{}  (Relationship: {})".format(e['QDescr'],e['PDescr']))
			else:
				print("Entity: {} (Relationship: {})".format(e['QCode'],e['PDescr']))
			self.findeffects(e['EntityId'],e['QCode'],n+1)
		
		
	def query(self,words):
		# Join the list items separated by " "	
		querystr=" ".join(words)
		print("Finding Causes containing the phrase \"{}\"..".format(querystr))
		self.db=mysql.connector.connect(user='<insert user here>', password='<insert password here>',host='<insert host name here>',database='<insert database name here>')
		
		sql="""select distinct e.EntityId, e.QCode, e.QDescr 
		from Entity e , Triple t 
		where e.QDescr is not NULL and e.QDescr like '%{}%' 
		and e.EntityId=t.Cause and t.Relationship not in (5,6,7) 
		""".format(querystr)
		
		order=" order by QDescr asc"

		cursor=self.db.cursor(dictionary=True)
		cursor.execute(sql+order)
		idx=0
		causes=cursor.fetchall()
		cursor.close()
		print("       Causes:")
		for cause in causes:
			idx+=1
			if cause['QDescr']!="missing deescription":
				print("{}. {}".format(idx,cause['QDescr']))
				
		prompt="Select the Cause (1-{}):\n\n".format(idx)
		sel=int(input(prompt))
		sel-=1
		print("Effects of {}:".format(causes[sel]['QDescr']))
		self.findeffects(causes[sel]['EntityId'],causes[sel]['QCode'],1)	
		print("")
		print("")

def queryeffects(args):
	e=EffectFinder()
	e.query(args[2:])
	e.close()
	return 0

def querycauses(args):
	q=CauseFinder()
	q.query(args[2:])
	q.close()
	return 0

if __name__ == '__main__':
	import sys
	if len(sys.argv)<2:
		print("Usage:")
		print("")
		print("Query causes:")
		print("./cae0query.py C <effect>")
		print("or ")
		print("python3 cae0query.py C <effect>")
		print("")
		print("Query effects:")
		print("./cae0query.py E <cause>")
		print("or ")
		print("python3 cae0query.py E <cause>")
		sys.exit(0)
		
	if sys.argv[1]=="C":	
		sys.exit(querycauses(sys.argv))
	elif sys.argv[1]=="E":	
		sys.exit(queryeffects(sys.argv))
	else:	
		print("Invalid option: {}".format(sys.argv[1]))
		sys.exit(0)
