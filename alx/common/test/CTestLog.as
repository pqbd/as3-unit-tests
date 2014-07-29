package alx.common.test
{
  /**
   * Test log.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CTestLog
  implements ITestLog
  {
    /** Line storage*/
    private var m_arLine:Array;
    /** Detalization level setting*/
    private var m_nDetalizationLevel:uint;
    /** Callstack info reation setting*/
    private var m_bShowCallStack:Boolean;

    /** Creates log.*/
    public function CTestLog():void
    {
      this.clear()
          .setDetalizationLevel( 0)
          .setShowCallStack( false)
          ;
    }

    public function addLine( strMessage:String, nDetalizationLevel:uint = 0, bCallStackInfo:Boolean = false):ITestLog
    {
      if ( nDetalizationLevel <= this.m_nDetalizationLevel)
      if (( !bCallStackInfo) || ( bCallStackInfo && this.m_bShowCallStack))
        this.m_arLine.push( strMessage);
      return this;
    }
    public function getLines():Array
    {
      return this.m_arLine;
    }
    public function toString( nOffset:uint = 0):String
    {
      var strResult:String = '';
      var strOffset:String = '';
      for ( var i:int = 0; i < nOffset; i++)
        strOffset += "\t";
      for ( i = 0; i < this.m_arLine.length; i++)
        strResult += this.m_arLine[ i].replace( /^(\t*)/mg, '$1'+strOffset)+"\n";
      return strResult;
    }
    public function clear():ITestLog
    {
      this.m_arLine = new Array();
      return this;
    }
    public function setDetalizationLevel( nLevel:uint):ITestLog
    {
      this.m_nDetalizationLevel = nLevel;
      return this;
    }
    public function setShowCallStack( bFlag:Boolean):ITestLog
    {
      this.m_bShowCallStack = bFlag;
      return this;
    }
  }
}