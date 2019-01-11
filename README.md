# min-max

A small library to provide `min` and `max` cross-platform constants for `Int` and `Float` types.

## Install

- `lix install gh:skial/min-max`

## Example

```Haxe
package ;

using be.Constant;

class Main {

    public static function main() {
        trace( Floats.MIN, Floats.MAX, Floats.MIN - 1, Floats.MAX + 1 );
        trace( Ints.MIN, Ints.MAX, Ints.MIN - 1, Ints.MAX + 1 );
    }

}
```