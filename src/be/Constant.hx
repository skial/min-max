package be;

class Constant {}

typedef Floats = F;
typedef Ints = I;

// @see https://github.com/HaxeFoundation/as3hx/blob/master/src/as3hx/Compat.hx#L260-L305
@:notNull abstract F(Float) from Float to Float {
    public static var MIN(get, never):Float;

    private static inline function get_MIN():Float {
        #if flash
        return untyped __global__['Number'].MIN_VALUE;
        #elseif js
        return js.Syntax.code('Number.MIN_VALUE');
        #elseif cs
        return untyped __cs__('double.MinValue');
        #elseif java
        return untyped __java__('Double.MIN_VALUE');
        #elseif cpp
        return 2.2250738585072e-308;
        #elseif hl
        // Should be the MIN IEEE double precison float.
        // @see https://haxe.org/blog/hashlink-in-depth-p2/
        return 1.1754943508e-38;
        #elseif python
        return Sys.float_info.min;
        #else
        return -1.79E+308;
        #end
    }

    public static var MAX(get, never):Float;

    private static inline function get_MAX():Float {
        #if flash
        return untyped __global__['Number'].MAX_VALUE;
        #elseif js
        return js.Syntax.code('Number.MAX_VALUE');
        #elseif cs
        return untyped __cs__('double.MaxValue');
        #elseif java
        return untyped __java__('Double.MAX_VALUE');
        #elseif cpp
        return 1.79769313486232e+308;
        #elseif hl
        return 3.4028234664e+38;
        #elseif python
        return Sys.float_info.max;
        #else
        return 1.79e+308;
        #end
    }
}

@:notNull abstract I(Int) from Int to Int {
    public static var MIN(get, never):Int;

    private static inline function get_MIN():Int {
        #if flash
        return untyped __global__['int'].MIN_VALUE;
        #elseif js
        return js.Syntax.code('Number.MIN_SAFE_INTEGER');
        #elseif cs
        return untyped __cs__('int.MinValue');
        #elseif java
        return untyped __java__('Integer.MIN_VALUE');
        #elseif (cpp || hl || neko)
        return -2147483648;
        #elseif python
        return -Sys.maxsize - 1;
        #elseif php
        return php.Const.PHP_INT_MIN;
        #else
        return -2147483648;//-2^31;
        #end
    }

    public static var MAX(get, never):Int;

    private static inline function get_MAX():Int {
         #if flash
        return untyped __global__['int'].MAX_VALUE;
        #elseif js
        return js.Syntax.code('Number.MAX_SAFE_INTEGER');
        #elseif cs
        return untyped __cs__('int.MaxValue');
        #elseif java
        return untyped __java__('Integer.MAX_VALUE');
        #elseif (cpp || hl || neko)
        return 2147483647;
        #elseif python
        return Sys.maxsize;
        #elseif php
        return php.Const.PHP_INT_MAX;
        #else
        return 2147483647;//2^31-1;
        #end
    }

}

#if python
@:pythonImport("sys")
private extern class Sys {
    public static var maxsize:Int;
    public static var float_info:{max:Float, min:Float};
}
#end