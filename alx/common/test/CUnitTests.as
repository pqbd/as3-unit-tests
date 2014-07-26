package alx.common.test
{
  import flash.display.DisplayObject;
  import flash.display.Sprite;

  /**
   * Unit test framework functions.
   * @author Alexander Volkov
   * @version 2.0.0
   */
  public class CUnitTests
  {
    /** Display only basic result*/
    public static const SIMPLE_MODE = 0;
    /** Display basic result of each test*/
    public static const EXTENDED_MODE = 1;
    /** Display all results*/
    public static const FULL_MODE = 2;
    /** Main test case*/
    private static var s_mainTestSuite:CTestSuite;
    /** Tester factory*/
    private static var s_testerFactory:CTesterFactory;
    /** Log factory*/
    private static var s_logFactory:CLogFactory;
    /** Display mode setting*/
    private static var s_nDisplayMode:uint;
    /** Show callstack setting*/
    private static var s_bShowCallStack:Boolean;

    /**
     * Inits framework.
     * @param testerClass Class
     * @param logClass Class
     * @param nDisplayMode uint
     * @param bShowCallStack Boolean
     */
    public static function init( testerClass:Class
                                , logClass:Class
                                , nDisplayMode:uint
                                , bShowCallStack:Boolean
                                ):void
    {
      CUnitTests.s_mainTestSuite = null;
      CUnitTests.s_testerFactory = new CTesterFactory( testerClass);
      CUnitTests.s_logFactory = new CLogFactory( logClass, nDisplayMode, bShowCallStack);
      CUnitTests.s_nDisplayMode = nDisplayMode;
      CUnitTests.s_bShowCallStack = bShowCallStack;
      CUnitTests.printHeader();
    }
    /** Prints header.*/
    protected static function printHeader():void
    {
      var strDisplayMode:String = 'unknown';
      if ( CUnitTests.isMode( CUnitTests.SIMPLE_MODE, true))
        strDisplayMode = 'SIMPLE_MODE';
      else
      if ( CUnitTests.isMode( CUnitTests.EXTENDED_MODE, true))
        strDisplayMode = 'EXTENDED_MODE';
      else
      if ( CUnitTests.isMode( CUnitTests.FULL_MODE, true))
        strDisplayMode = 'FULL_MODE';
      CUnitTests.printLine( 'CUnitTests v. '+CUnitTests.getVersion()
                          +' {Tester: '+CUnitTests.s_testerFactory.getClass()
                          +'; Log: '+CUnitTests.s_logFactory.getClass()
                          +'; Display mode: '+strDisplayMode
                          +'; Show callstack: '+CUnitTests.s_bShowCallStack
                          +"}\n"
                          );
    }
    /** Gets version of framework.
     * @return String
     */
    public static function getVersion():String
    {
      return '2.0.0';
    }
    /** Gets tester factory.
     * @return {@link alx.common.test.CTesterFactory}
     */
    public static function getTesterFactory():CTesterFactory
    {
      return CUnitTests.s_testerFactory;
    }
    /** Gets log factory.
     * @return {@link alx.common.test.CLogFactory}
     */
    public static function getLogFactory():CLogFactory
    {
      return CUnitTests.s_logFactory;
    }
    /** Checks if CallStack is needed.
     * @return Boolean
     */
    public static function isShowCallStack():Boolean
    {
      return CUnitTests.s_bShowCallStack;
    }
    /** Checks display mode.
     * @param nDisplayMode uint
     * @param bExact Boolean
     * @return Boolean
     */
    public static function isMode( nDisplayMode:uint, bExact: Boolean = false):Boolean
    {
      if ( bExact)
        return ( CUnitTests.s_nDisplayMode == nDisplayMode);
      else
        return ( CUnitTests.s_nDisplayMode >= nDisplayMode);
    }
    /**
     * Checks if there is a global error.
     * @return Boolean
     */
    public static function isError():Boolean
    {
      if ( CUnitTests.s_mainTestSuite == null)
        return false;
      else
        return CUnitTests.s_mainTestSuite.getTester().isError();
    }
    /**
     * Prints text.
     * @param strValue String
     */
    public static function printLine( strValue:String):void
    {
      trace( strValue);
    }
    /** Prints results*/
    public static function printResult( display:DisplayObject = null):void
    {
      var nColor:uint = 0;
      if ( CUnitTests.s_mainTestSuite != null)
        CUnitTests.printLine( CUnitTests.s_mainTestSuite.getLog().toString());
      if ( CUnitTests.isError())
      {
        nColor = 0xcc0000;
        CUnitTests.printLine( "\n"+'Fail');
      }
      else
      {
        nColor = 0x00cc00;
        CUnitTests.printLine( "\n"+'Success');
      }
      if ( display != null)
      {
        var sprite:Sprite = new Sprite();
        sprite.graphics.beginFill( nColor);
        sprite.graphics.drawRect( 0, 0, display.stage.stageWidth, display.stage.stageHeight);
        display.stage.addChild( sprite);
      }
    }
    /**
     * Runs unit tests.
     * @param arUnitTest Array of Class exteds CUnitTest
     */
    public static function run( ...arTestCaseClass):void
    {
      CUnitTests.s_mainTestSuite = new CFrameworkTestSuite();
      for ( var i:int; i < arTestCaseClass.length; i++)
        CUnitTests.s_mainTestSuite.addTestCaseClass( arTestCaseClass[ i]);
      CUnitTests.s_mainTestSuite.start();
    }
  }
}

import alx.common.test.CUnitTests;
import alx.common.test.CTester;
import alx.common.test.CTestLog;
CUnitTests.init( CTester
               , CTestLog
               , CUnitTests.SIMPLE_MODE
               , true
               );