package alx.common.test
{
  /**
   * Tester.
   * @author Alexander Volkov
   * @version 2.0
   */
  public class CTester
  implements ITester
  {
    /** Label of tester*/
    private var m_strLabel:String;
    /** Status of test process*/
    private var m_bError:Boolean;

    /**
     * Creates tester.
     * @param strLabel String
     */
    public function CTester( strLabel:String = null):void
    {
      if ( strLabel === null)
        strLabel = '';
      this.setLabel( strLabel);
      this.m_bError = false;
    }

    protected function makeComment( strTitle:String, testValue:Object, correctValue:Object):String
    {
      return strTitle
            +' was: '+testValue
            +' expected: '+correctValue
            ;
    }
    
    public function setLabel( strValue:String):void
    {
      this.m_strLabel = strValue;
    }
    public function getLabel():String
    {
      return this.m_strLabel;
    }
    public function isTrue( strTitle:String, bTest:Boolean):Boolean
    {
      if ( !bTest)
        this.error( strTitle, this.makeComment( 'not true', bTest, true));
      return bTest;
    }
    public function isFalse( strTitle:String, bTest:Boolean):Boolean
    {
      if ( bTest)
        this.error( strTitle, this.makeComment( 'not false', bTest, false));
      return !bTest;
    }    
    public function isEqual( strTitle:String, testValue:Object, correctValue:Object):Boolean
    {
      var bAnswer:Boolean = true;
      if ( testValue !== correctValue)
      {
        this.error( strTitle, this.makeComment( 'not equal', testValue, correctValue));
        bAnswer = false;
      }
      return bAnswer;
    }
    public function isNotEqual( strTitle:String, testValue:Object, correctValue:Object):Boolean
    {
      var bAnswer:Boolean = true;
      if ( testValue === correctValue)
      {
        this.error( strTitle, this.makeComment( 'equal', testValue, correctValue));
        bAnswer = false;
      }
      return bAnswer;
    }
    public function notHere( strTitle:String):Boolean
    {
      return this.isFalse( strTitle+'[not here]', true);
    }
    public function error( strTitle:String, strComment:String = ''):void
    {
      this.m_bError = true;
      if ( strComment != '')
        strComment = "\t"+strComment;
      throw Error(( strTitle+strComment));
    }
    public function isError():Boolean
    {
      return this.m_bError;
    }
  }
}