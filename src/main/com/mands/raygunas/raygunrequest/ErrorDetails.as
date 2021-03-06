/**
 * Created by zan on 04/02/2014.
 */
package com.mands.raygunas.raygunrequest
{

public class ErrorDetails
{
    public var message:String;
    public var stackTrace:Array;
    public var className:String;

    public function ErrorDetails( error:Error)
    {
        message=error.message;
        stackTrace= parseStackTrace(error.getStackTrace());
        className = parseErrorClass(error.getStackTrace());
    }

    public static function parseErrorClass( stackTrace:String ):String
    {
        var errorClass:String = stackTrace.slice(0, stackTrace.indexOf(":"));
        return errorClass;
    }

    public static function parseStackTrace( stackTrace:String ):Array
    {
        var stackTraceLines:Array = stackTrace.split("\n");
        var stackLines:Array = new Array();

        for(var i:int=0; i<stackTraceLines.length; i++){
            if(stackTraceLines[i].indexOf("at ") >= 0)
            {
                stackLines.push(new StackLine(stackTraceLines[i]));
            }
        }
        return stackLines;
    }
}
}
