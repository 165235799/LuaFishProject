﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LuaToolWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(LuaTool), typeof(System.Object));
		L.RegFunction("GetGameObject", GetGameObject);
		L.RegFunction("GetTransform", GetTransform);
		L.RegFunction("GetComponent", GetComponent);
		L.RegFunction("InstanceObj", InstanceObj);
		L.RegFunction("DebugLog", DebugLog);
		L.RegFunction("DebugDrawLine", DebugDrawLine);
		L.RegFunction("OnClick", OnClick);
		L.RegFunction("AddListener", AddListener);
		L.RegFunction("SetGameObjectActive", SetGameObjectActive);
		L.RegFunction("ScreenVectorToLocalVector", ScreenVectorToLocalVector);
		L.RegFunction("WorldToScenePos", WorldToScenePos);
		L.RegFunction("GetBulletMoveDir", GetBulletMoveDir);
		L.RegFunction("GetFishLuaTable", GetFishLuaTable);
		L.RegFunction("FishDeath", FishDeath);
		L.RegFunction("New", _CreateLuaTool);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateLuaTool(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				LuaTool obj = new LuaTool();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: LuaTool.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetGameObject(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2 && TypeChecker.CheckTypes<UnityEngine.Transform, string>(L, 1))
			{
				UnityEngine.Transform arg0 = (UnityEngine.Transform)ToLua.ToObject(L, 1);
				string arg1 = ToLua.ToString(L, 2);
				UnityEngine.GameObject o = LuaTool.GetGameObject(arg0, arg1);
				ToLua.PushSealed(L, o);
				return 1;
			}
			else if (count == 2 && TypeChecker.CheckTypes<UnityEngine.GameObject, string>(L, 1))
			{
				UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.ToObject(L, 1);
				string arg1 = ToLua.ToString(L, 2);
				UnityEngine.GameObject o = LuaTool.GetGameObject(arg0, arg1);
				ToLua.PushSealed(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaTool.GetGameObject");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetTransform(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2 && TypeChecker.CheckTypes<UnityEngine.Transform, string>(L, 1))
			{
				UnityEngine.Transform arg0 = (UnityEngine.Transform)ToLua.ToObject(L, 1);
				string arg1 = ToLua.ToString(L, 2);
				UnityEngine.Transform o = LuaTool.GetTransform(arg0, arg1);
				ToLua.Push(L, o);
				return 1;
			}
			else if (count == 2 && TypeChecker.CheckTypes<UnityEngine.GameObject, string>(L, 1))
			{
				UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.ToObject(L, 1);
				string arg1 = ToLua.ToString(L, 2);
				UnityEngine.Transform o = LuaTool.GetTransform(arg0, arg1);
				ToLua.Push(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaTool.GetTransform");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetComponent(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 3 && TypeChecker.CheckTypes<UnityEngine.Transform, string, string>(L, 1))
			{
				UnityEngine.Transform arg0 = (UnityEngine.Transform)ToLua.ToObject(L, 1);
				string arg1 = ToLua.ToString(L, 2);
				string arg2 = ToLua.ToString(L, 3);
				UnityEngine.Component o = LuaTool.GetComponent(arg0, arg1, arg2);
				ToLua.Push(L, o);
				return 1;
			}
			else if (count == 3 && TypeChecker.CheckTypes<UnityEngine.GameObject, string, string>(L, 1))
			{
				UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.ToObject(L, 1);
				string arg1 = ToLua.ToString(L, 2);
				string arg2 = ToLua.ToString(L, 3);
				UnityEngine.Component o = LuaTool.GetComponent(arg0, arg1, arg2);
				ToLua.Push(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaTool.GetComponent");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int InstanceObj(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckObject(L, 1, typeof(UnityEngine.GameObject));
			UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 2);
			LuaFunction arg2 = ToLua.CheckLuaFunction(L, 3);
			LuaTool.InstanceObj(arg0, arg1, arg2);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DebugLog(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 1);
			string arg1 = ToLua.CheckString(L, 2);
			LuaTool.DebugLog(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DebugDrawLine(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 1);
			UnityEngine.Vector3 arg1 = ToLua.ToVector3(L, 2);
			LuaTool.DebugDrawLine(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnClick(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2 && TypeChecker.CheckTypes<UnityEngine.GameObject, LuaInterface.LuaFunction>(L, 1))
			{
				UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.ToObject(L, 1);
				LuaFunction arg1 = ToLua.ToLuaFunction(L, 2);
				LuaTool.OnClick(arg0, arg1);
				return 0;
			}
			else if (count == 2 && TypeChecker.CheckTypes<UnityEngine.Transform, LuaInterface.LuaFunction>(L, 1))
			{
				UnityEngine.Transform arg0 = (UnityEngine.Transform)ToLua.ToObject(L, 1);
				LuaFunction arg1 = ToLua.ToLuaFunction(L, 2);
				LuaTool.OnClick(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaTool.OnClick");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddListener(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 4 && TypeChecker.CheckTypes<UnityEngine.GameObject, LuaInterface.LuaFunction, LuaInterface.LuaFunction, LuaInterface.LuaFunction>(L, 1))
			{
				UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.ToObject(L, 1);
				LuaFunction arg1 = ToLua.ToLuaFunction(L, 2);
				LuaFunction arg2 = ToLua.ToLuaFunction(L, 3);
				LuaFunction arg3 = ToLua.ToLuaFunction(L, 4);
				LuaTool.AddListener(arg0, arg1, arg2, arg3);
				return 0;
			}
			else if (count == 4 && TypeChecker.CheckTypes<UnityEngine.Transform, LuaInterface.LuaFunction, LuaInterface.LuaFunction, LuaInterface.LuaFunction>(L, 1))
			{
				UnityEngine.Transform arg0 = (UnityEngine.Transform)ToLua.ToObject(L, 1);
				LuaFunction arg1 = ToLua.ToLuaFunction(L, 2);
				LuaFunction arg2 = ToLua.ToLuaFunction(L, 3);
				LuaFunction arg3 = ToLua.ToLuaFunction(L, 4);
				LuaTool.AddListener(arg0, arg1, arg2, arg3);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaTool.AddListener");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetGameObjectActive(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2 && TypeChecker.CheckTypes<UnityEngine.Transform, bool>(L, 1))
			{
				UnityEngine.Transform arg0 = (UnityEngine.Transform)ToLua.ToObject(L, 1);
				bool arg1 = LuaDLL.lua_toboolean(L, 2);
				LuaTool.SetGameObjectActive(arg0, arg1);
				return 0;
			}
			else if (count == 2 && TypeChecker.CheckTypes<UnityEngine.GameObject, bool>(L, 1))
			{
				UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.ToObject(L, 1);
				bool arg1 = LuaDLL.lua_toboolean(L, 2);
				LuaTool.SetGameObjectActive(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaTool.SetGameObjectActive");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ScreenVectorToLocalVector(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Transform arg0 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 1);
			UnityEngine.Vector3 arg1 = ToLua.ToVector3(L, 2);
			UnityEngine.Vector2 o = LuaTool.ScreenVectorToLocalVector(arg0, arg1);
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int WorldToScenePos(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Camera arg0 = (UnityEngine.Camera)ToLua.CheckObject(L, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 arg1 = ToLua.ToVector3(L, 2);
			UnityEngine.Vector3 o = LuaTool.WorldToScenePos(arg0, arg1);
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetBulletMoveDir(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			UnityEngine.Vector3 arg0 = ToLua.ToVector3(L, 1);
			UnityEngine.Vector2 o = LuaTool.GetBulletMoveDir(arg0);
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetFishLuaTable(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1 && TypeChecker.CheckTypes<UnityEngine.Transform>(L, 1))
			{
				UnityEngine.Transform arg0 = (UnityEngine.Transform)ToLua.ToObject(L, 1);
				LuaInterface.LuaTable o = LuaTool.GetFishLuaTable(arg0);
				ToLua.Push(L, o);
				return 1;
			}
			else if (count == 1 && TypeChecker.CheckTypes<UnityEngine.GameObject>(L, 1))
			{
				UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.ToObject(L, 1);
				LuaInterface.LuaTable o = LuaTool.GetFishLuaTable(arg0);
				ToLua.Push(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaTool.GetFishLuaTable");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int FishDeath(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1 && TypeChecker.CheckTypes<UnityEngine.Transform>(L, 1))
			{
				UnityEngine.Transform arg0 = (UnityEngine.Transform)ToLua.ToObject(L, 1);
				LuaTool.FishDeath(arg0);
				return 0;
			}
			else if (count == 1 && TypeChecker.CheckTypes<UnityEngine.GameObject>(L, 1))
			{
				UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.ToObject(L, 1);
				LuaTool.FishDeath(arg0);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaTool.FishDeath");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

