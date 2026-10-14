<GameFile>
  <PropertyGroup Name="guild_send_mail_window" Type="Layer" ID="a97uvf6yxm32e8q0o4t-kjrb1lzw5nhscgid" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="1431875313" Tag="428" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="178" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="container" ActionTag="417157888" Tag="408" RotationSkewX="0" RotationSkewY="0" LeftMargin="48" RightMargin="48" TopMargin="260" BottomMargin="260" TouchEnable="True" FrameEvent="end_frame" BackColorAlpha="102" Scale9Enable="True" LeftEage="21" RightEage="21" TopEage="21" BottomEage="21" Scale9OriginX="21" Scale9OriginY="21" Scale9Width="52" Scale9Height="54" ctype="PanelObjectData">
            <Size Y="760" X="624" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="PlistSubImage" Path="common_1039.png" Plist="resource/common/common.plist" />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="img_title_bg" ActionTag="-776242333" Tag="411" RotationSkewX="0" RotationSkewY="0" LeftMargin="146" RightMargin="146" TopMargin="-22.5641" BottomMargin="719.564087" LeftEage="56" RightEage="56" TopEage="0" BottomEage="0" Scale9OriginX="56" Scale9OriginY="0" Scale9Width="47" Scale9Height="63" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="63" X="332" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="312" Y="751.064087" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1024.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="win_title" ActionTag="-219774603" Tag="415" RotationSkewX="0" RotationSkewY="0" LeftMargin="258.684814" RightMargin="255.315201" TopMargin="-11.7818" BottomMargin="733.781799" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="38" X="110" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="313.684814" Y="752.781799" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_close" ActionTag="-144611346" Tag="412" RotationSkewX="0" RotationSkewY="0" LeftMargin="573.400024" RightMargin="-19.4" TopMargin="-6.832" BottomMargin="704.83197" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="40" Scale9Height="40" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="62" X="70" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="608.400024" Y="735.83197" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1028.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="txt_send_name_title" ActionTag="239926331" Tag="427" RotationSkewX="0" RotationSkewY="0" LeftMargin="34.500099" RightMargin="492.499908" TopMargin="62.6451" BottomMargin="666.354919" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="31" X="97" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="34.500099" Y="681.854919" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="54" G="85" R="124" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="img_send_bg" ActionTag="946403728" Tag="502" RotationSkewX="0" RotationSkewY="0" LeftMargin="34.507198" RightMargin="34.492802" TopMargin="102.003098" BottomMargin="607.996887" LeftEage="13" RightEage="13" TopEage="16" BottomEage="16" Scale9OriginX="13" Scale9OriginY="16" Scale9Width="14" Scale9Height="18" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="50" X="555" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="34.507198" Y="632.996887" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1021.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="txt_send_name" ActionTag="-1157792115" Tag="705" RotationSkewX="0" RotationSkewY="0" LeftMargin="45.4151" RightMargin="533.5849" TopMargin="110.9907" BottomMargin="618.009277" FontSize="24" LabelText="@all" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="31" X="45" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="45.4151" Y="633.509277" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="34" G="83" R="149" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="txt_send_cont_title" ActionTag="-1061460996" Tag="408" RotationSkewX="0" RotationSkewY="0" LeftMargin="34.499901" RightMargin="530.500122" TopMargin="157.333893" BottomMargin="571.666077" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="31" X="59" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="34.499901" Y="587.166077" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="54" G="85" R="124" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="img_send_cont_bg" ActionTag="2022254487" Tag="407" RotationSkewX="0" RotationSkewY="0" LeftMargin="34.5" RightMargin="34.5" TopMargin="193.109299" BottomMargin="121.890701" LeftEage="13" RightEage="13" TopEage="16" BottomEage="16" Scale9OriginX="13" Scale9OriginY="16" Scale9Width="14" Scale9Height="18" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="445" X="555" />
                <AnchorPoint ScaleX="0" ScaleY="1" />
                <Position X="34.5" Y="566.890686" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1021.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_send" ActionTag="778767801" Tag="413" RotationSkewX="0" RotationSkewY="0" LeftMargin="227.5" RightMargin="227.5" TopMargin="660.702515" BottomMargin="35.297501" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="17" BottomEage="17" Scale9OriginX="17" Scale9OriginY="17" Scale9Width="30" Scale9Height="29" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="64" X="169" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="312" Y="67.297501" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="1395175843" Tag="414" RotationSkewX="0" RotationSkewY="0" LeftMargin="48.5" RightMargin="48.5" TopMargin="13" BottomMargin="13" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="38" X="72" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="84.5" Y="32" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="118" G="239" R="248" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="5" G="39" R="92" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
