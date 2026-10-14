<GameFile>
  <PropertyGroup Name="forgehouse_window" Type="Layer" ID="z2d15u7qo9jmfwep8ntrbgsh-6iyxc43kl0a" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="bg" ActionTag="-1268590219" Tag="199" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="617" BottomMargin="617" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
            <Size Y="46" X="46" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="920851627" Tag="88" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0.0001" BottomMargin="-0.0001" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0" />
            <Position X="360" Y="-0.0001" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="equip_container" ActionTag="-837985770" Tag="77" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="1280" X="720" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="0" Y="0" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="image_stage" ActionTag="-1233666041" Tag="78" RotationSkewX="0" RotationSkewY="0" LeftMargin="37" RightMargin="37" TopMargin="308" BottomMargin="648" LeftEage="-167" RightEage="-167" TopEage="-60" BottomEage="-60" Scale9OriginX="-167" Scale9OriginY="-60" Scale9Width="380" Scale9Height="166" ctype="ImageViewObjectData">
                    <Size Y="324" X="646" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="360" Y="810" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Sprite_12" ActionTag="1290648998" Tag="160" RotationSkewX="0" RotationSkewY="0" LeftMargin="351.161102" RightMargin="337.838898" TopMargin="248.539993" BottomMargin="975.460022" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="56" X="31" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="366.661102" Y="1003.460022" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_90034.png" Plist="resource/common/common.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="bar_bg" ActionTag="738730264" Tag="161" RotationSkewX="0" RotationSkewY="0" LeftMargin="159.000702" RightMargin="460.999298" TopMargin="323.01001" BottomMargin="934.98999" LeftEage="37" RightEage="37" TopEage="6" BottomEage="6" Scale9OriginX="37" Scale9OriginY="6" Scale9Width="40" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="22" X="100" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="159.000702" Y="945.98999" />
                    <Scale ScaleX="0.9873" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="forgehouse_bar_bg.png" Plist="resource/forgehouse/forgehouse.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="bar" ActionTag="543137761" Tag="5" RotationSkewX="0" RotationSkewY="0" LeftMargin="159.000702" RightMargin="460.999298" TopMargin="323.01001" BottomMargin="934.98999" ctype="LoadingBarObjectData">
                    <Size Y="22" X="100" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="159.000702" Y="945.98999" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <ImageFileData Type="PlistSubImage" Path="forgehouse_bar.png" Plist="resource/forgehouse/forgehouse.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="bar_num" ActionTag="-1175402828" Tag="27" RotationSkewX="0" RotationSkewY="0" LeftMargin="198.000107" RightMargin="501.999908" TopMargin="320.51001" BottomMargin="934.48999" FontSize="18" LabelText="---" OutlineEnabled="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="25" X="20" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="208.000107" Y="946.98999" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="52" G="66" R="84" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_1" ActionTag="2137723662" Tag="43" RotationSkewX="0" RotationSkewY="0" LeftMargin="3.704" RightMargin="6.296" TopMargin="626.849976" BottomMargin="225.149994" LeftEage="20" RightEage="20" TopEage="21" BottomEage="21" Scale9OriginX="20" Scale9OriginY="21" Scale9Width="6" Scale9Height="8" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="428" X="710" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="358.70401" Y="225.149994" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1036.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="tab_container" ActionTag="1032990838" Tag="6" RotationSkewX="0" RotationSkewY="0" LeftMargin="47" RightMargin="8" TopMargin="-46" BottomMargin="406" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size Y="68" X="655" />
                        <AnchorPoint ScaleX="0" ScaleY="0" />
                        <Position X="47" Y="406" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData />
                        <FirstColor A="255" B="255" G="200" R="150" />
                        <EndColor A="255" B="255" G="255" R="255" />
                        <ColorVector ScaleX="0" ScaleY="1" />
                        <SingleColor A="255" B="255" G="200" R="150" />
                        <Children>
                          <AbstractNodeData Name="tab_btn_4" ActionTag="356589371" Tag="10" RotationSkewX="0" RotationSkewY="0" LeftMargin="448" RightMargin="59" TopMargin="11.0001" BottomMargin="4.9999" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                            <Size Y="52" X="148" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="522" Y="30.999901" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="255" G="255" R="255" />
                            <FileData />
                            <FirstColor A="255" B="255" G="200" R="150" />
                            <EndColor A="255" B="255" G="255" R="255" />
                            <ColorVector ScaleX="0" ScaleY="1" />
                            <SingleColor A="255" B="255" G="200" R="150" />
                            <Children>
                              <AbstractNodeData Name="normal" ActionTag="-932054088" Tag="22" RotationSkewX="0" RotationSkewY="0" LeftMargin="-3" RightMargin="-3" TopMargin="0" BottomMargin="0" LeftEage="18" RightEage="18" TopEage="15" BottomEage="15" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="7" Scale9Height="37" Scale9Enable="True" ctype="ImageViewObjectData">
                                <Size Y="52" X="154" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="74" Y="26" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="common_2010.png" Plist="resource/common/common.plist" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="select" ActionTag="-1396778126" Tag="23" RotationSkewX="0" RotationSkewY="0" LeftMargin="-3" RightMargin="-3" TopMargin="0" BottomMargin="0" LeftEage="18" RightEage="18" TopEage="15" BottomEage="15" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="7" Scale9Height="37" Scale9Enable="True" ctype="ImageViewObjectData">
                                <Size Y="52" X="154" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="74" Y="26" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="common_2009.png" Plist="resource/common/common.plist" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="redpoint" ActionTag="-380726552" Tag="36" RotationSkewX="0" RotationSkewY="0" LeftMargin="117.5" RightMargin="5.5" TopMargin="-9.5" BottomMargin="36.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                                <Size Y="25" X="25" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="130" Y="49" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="mainui_1009.png" Plist="resource/mainui/mainui.plist" />
                                <BlendFunc Dst="771" Src="1" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="title" ActionTag="-1149262685" Tag="32" RotationSkewX="0" RotationSkewY="0" LeftMargin="54.5" RightMargin="66.5" TopMargin="10.502" BottomMargin="6.498" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                                <Size Y="35" X="27" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="68" Y="23.997999" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="208" G="238" R="249" />
                                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                                <OutlineColor A="255" B="5" G="39" R="92" />
                                <ShadowColor A="255" B="110" G="110" R="110" />
                              </AbstractNodeData>
                            </Children>
                          </AbstractNodeData>
                          <AbstractNodeData Name="tab_btn_3" ActionTag="304092596" Tag="9" RotationSkewX="0" RotationSkewY="0" LeftMargin="300" RightMargin="207" TopMargin="11.0001" BottomMargin="4.9999" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                            <Size Y="52" X="148" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="374" Y="30.999901" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="255" G="255" R="255" />
                            <FileData />
                            <FirstColor A="255" B="255" G="200" R="150" />
                            <EndColor A="255" B="255" G="255" R="255" />
                            <ColorVector ScaleX="0" ScaleY="1" />
                            <SingleColor A="255" B="255" G="200" R="150" />
                            <Children>
                              <AbstractNodeData Name="normal" ActionTag="-201995529" Tag="21" RotationSkewX="0" RotationSkewY="0" LeftMargin="-3" RightMargin="-3" TopMargin="0" BottomMargin="0" LeftEage="18" RightEage="18" TopEage="15" BottomEage="15" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="7" Scale9Height="37" Scale9Enable="True" ctype="ImageViewObjectData">
                                <Size Y="52" X="154" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="74" Y="26" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="common_2010.png" Plist="resource/common/common.plist" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="select" ActionTag="811812110" Tag="24" RotationSkewX="0" RotationSkewY="0" LeftMargin="-3" RightMargin="-3" TopMargin="0" BottomMargin="0" LeftEage="18" RightEage="18" TopEage="15" BottomEage="15" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="7" Scale9Height="37" Scale9Enable="True" ctype="ImageViewObjectData">
                                <Size Y="52" X="154" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="74" Y="26" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="common_2009.png" Plist="resource/common/common.plist" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="redpoint" ActionTag="1229470234" Tag="35" RotationSkewX="0" RotationSkewY="0" LeftMargin="117.5" RightMargin="5.5" TopMargin="-9.5" BottomMargin="36.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                                <Size Y="25" X="25" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="130" Y="49" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="mainui_1009.png" Plist="resource/mainui/mainui.plist" />
                                <BlendFunc Dst="771" Src="1" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="title" ActionTag="1557120769" Tag="31" RotationSkewX="0" RotationSkewY="0" LeftMargin="54.5" RightMargin="66.5" TopMargin="10.502" BottomMargin="6.498" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                                <Size Y="35" X="27" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="68" Y="23.997999" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="208" G="238" R="249" />
                                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                                <OutlineColor A="255" B="5" G="39" R="92" />
                                <ShadowColor A="255" B="110" G="110" R="110" />
                              </AbstractNodeData>
                            </Children>
                          </AbstractNodeData>
                          <AbstractNodeData Name="tab_btn_2" ActionTag="973682347" Tag="8" RotationSkewX="0" RotationSkewY="0" LeftMargin="152" RightMargin="355" TopMargin="11.0001" BottomMargin="4.9999" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                            <Size Y="52" X="148" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="226" Y="30.999901" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="255" G="255" R="255" />
                            <FileData />
                            <FirstColor A="255" B="255" G="200" R="150" />
                            <EndColor A="255" B="255" G="255" R="255" />
                            <ColorVector ScaleX="0" ScaleY="1" />
                            <SingleColor A="255" B="255" G="200" R="150" />
                            <Children>
                              <AbstractNodeData Name="normal" ActionTag="47826346" Tag="20" RotationSkewX="0" RotationSkewY="0" LeftMargin="-3" RightMargin="-3" TopMargin="0" BottomMargin="0" LeftEage="18" RightEage="18" TopEage="15" BottomEage="15" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="7" Scale9Height="37" Scale9Enable="True" ctype="ImageViewObjectData">
                                <Size Y="52" X="154" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="74" Y="26" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="common_2010.png" Plist="resource/common/common.plist" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="select" ActionTag="-515107268" Tag="25" RotationSkewX="0" RotationSkewY="0" LeftMargin="-3" RightMargin="-3" TopMargin="0" BottomMargin="0" LeftEage="18" RightEage="18" TopEage="15" BottomEage="15" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="7" Scale9Height="37" Scale9Enable="True" ctype="ImageViewObjectData">
                                <Size Y="52" X="154" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="74" Y="26" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="common_2009.png" Plist="resource/common/common.plist" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="redpoint" ActionTag="640655521" Tag="34" RotationSkewX="0" RotationSkewY="0" LeftMargin="117.5" RightMargin="5.5" TopMargin="-9.5" BottomMargin="36.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                                <Size Y="25" X="25" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="130" Y="49" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="mainui_1009.png" Plist="resource/mainui/mainui.plist" />
                                <BlendFunc Dst="771" Src="1" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="title" ActionTag="118026314" Tag="30" RotationSkewX="0" RotationSkewY="0" LeftMargin="54.5" RightMargin="66.5" TopMargin="10.502" BottomMargin="6.498" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                                <Size Y="35" X="27" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="68" Y="23.997999" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="208" G="238" R="249" />
                                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                                <OutlineColor A="255" B="5" G="39" R="92" />
                                <ShadowColor A="255" B="110" G="110" R="110" />
                              </AbstractNodeData>
                            </Children>
                          </AbstractNodeData>
                          <AbstractNodeData Name="tab_btn_1" ActionTag="-1292456062" Tag="7" RotationSkewX="0" RotationSkewY="0" LeftMargin="4" RightMargin="503" TopMargin="11" BottomMargin="5" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                            <Size Y="52" X="148" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="78" Y="31" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="255" G="255" R="255" />
                            <FileData />
                            <FirstColor A="255" B="255" G="200" R="150" />
                            <EndColor A="255" B="255" G="255" R="255" />
                            <ColorVector ScaleX="0" ScaleY="1" />
                            <SingleColor A="255" B="255" G="200" R="150" />
                            <Children>
                              <AbstractNodeData Name="normal" ActionTag="-1150524355" Tag="19" RotationSkewX="0" RotationSkewY="0" LeftMargin="-3" RightMargin="-3" TopMargin="0" BottomMargin="0" LeftEage="18" RightEage="18" TopEage="15" BottomEage="15" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="7" Scale9Height="37" Scale9Enable="True" ctype="ImageViewObjectData">
                                <Size Y="52" X="154" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="74" Y="26" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="common_2010.png" Plist="resource/common/common.plist" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="select" ActionTag="937277618" Tag="26" RotationSkewX="0" RotationSkewY="0" LeftMargin="-3" RightMargin="-3" TopMargin="0" BottomMargin="0" LeftEage="18" RightEage="18" TopEage="15" BottomEage="15" Scale9OriginX="18" Scale9OriginY="15" Scale9Width="7" Scale9Height="37" Scale9Enable="True" ctype="ImageViewObjectData">
                                <Size Y="52" X="154" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="74" Y="26" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="common_2009.png" Plist="resource/common/common.plist" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="redpoint" ActionTag="-2123371175" Tag="33" RotationSkewX="0" RotationSkewY="0" LeftMargin="117.500198" RightMargin="5.4998" TopMargin="-9.5" BottomMargin="36.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                                <Size Y="25" X="25" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="130.000198" Y="49" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="255" G="255" R="255" />
                                <FileData Type="PlistSubImage" Path="mainui_1009.png" Plist="resource/mainui/mainui.plist" />
                                <BlendFunc Dst="771" Src="1" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="title" ActionTag="-328940916" Tag="29" RotationSkewX="0" RotationSkewY="0" LeftMargin="54.5" RightMargin="66.5" TopMargin="10.502" BottomMargin="6.498" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                                <Size Y="35" X="27" />
                                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                                <Position X="68" Y="23.997999" />
                                <Scale ScaleX="1" ScaleY="1" />
                                <CColor A="255" B="208" G="238" R="249" />
                                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                                <OutlineColor A="255" B="5" G="39" R="92" />
                                <ShadowColor A="255" B="110" G="110" R="110" />
                              </AbstractNodeData>
                            </Children>
                          </AbstractNodeData>
                        </Children>
                      </AbstractNodeData>
                      <AbstractNodeData Name="Image_1_0" ActionTag="375997505" Tag="44" RotationSkewX="0" RotationSkewY="0" LeftMargin="17.5" RightMargin="17.5" TopMargin="15" BottomMargin="15" LeftEage="32" RightEage="32" TopEage="33" BottomEage="33" Scale9OriginX="32" Scale9OriginY="33" Scale9Width="7" Scale9Height="11" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="398" X="675" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="355" Y="214" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="common_1037.png" Plist="resource/common/common.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="goods_con" ActionTag="563570345" Tag="32" RotationSkewX="0" RotationSkewY="0" LeftMargin="40.000599" RightMargin="42.999401" TopMargin="658" BottomMargin="259" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="363" X="637" />
                    <AnchorPoint ScaleX="0" ScaleY="0" />
                    <Position X="40.000599" Y="259" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_composite" ActionTag="623618392" Tag="94" RotationSkewX="0" RotationSkewY="0" LeftMargin="147.501404" RightMargin="413.498596" TopMargin="475.5" BottomMargin="743.5" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="21" BottomEage="21" Scale9OriginX="17" Scale9OriginY="21" Scale9Width="30" Scale9Height="21" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="61" X="159" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="227.001404" Y="774" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1018.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="Text_1" ActionTag="1946860854" Tag="95" RotationSkewX="0" RotationSkewY="0" LeftMargin="66" RightMargin="66" TopMargin="13" BottomMargin="13" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="35" X="27" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="79.5" Y="30.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="118" G="239" R="248" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="5" G="39" R="92" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_all_composite" ActionTag="-409907903" Tag="56" RotationSkewX="0" RotationSkewY="0" LeftMargin="392.5" RightMargin="168.5" TopMargin="474" BottomMargin="742" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="21" BottomEage="21" Scale9OriginX="17" Scale9OriginY="21" Scale9Width="30" Scale9Height="21" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="64" X="159" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="472" Y="774" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="Text_1" ActionTag="178358372" Tag="57" RotationSkewX="0" RotationSkewY="0" LeftMargin="66" RightMargin="66" TopMargin="14.5" BottomMargin="14.5" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="35" X="27" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="79.5" Y="32" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="118" G="239" R="248" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="5" G="39" R="92" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_comp" ActionTag="-1700465659" Tag="77" RotationSkewX="0" RotationSkewY="0" LeftMargin="618" RightMargin="26" TopMargin="107" BottomMargin="1097" TouchEnable="True" LeftEage="8" RightEage="8" TopEage="21" BottomEage="21" Scale9OriginX="8" Scale9OriginY="21" Scale9Width="60" Scale9Height="34" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="76" X="76" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="656" Y="1135" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="forgrhouse_3.png" Plist="resource/forgehouse/forgehouse.plist" />
                    <Children>
                      <AbstractNodeData Name="Text_1" ActionTag="-158585908" Tag="78" RotationSkewX="0" RotationSkewY="0" LeftMargin="26" RightMargin="26" TopMargin="52.5" BottomMargin="-9.5" FontSize="22" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="33" X="24" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="38" Y="7" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="190" G="231" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_add" ActionTag="12431028" Tag="142" RotationSkewX="0" RotationSkewY="0" LeftMargin="456.000488" RightMargin="221.999496" TopMargin="363.01001" BottomMargin="874.98999" TouchEnable="True" LeftEage="11" RightEage="11" TopEage="21" BottomEage="21" Scale9OriginX="11" Scale9OriginY="21" Scale9Width="20" Scale9Height="1" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="42" X="42" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="477.000488" Y="895.98999" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1015.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="Text_1" Visible="False" ActionTag="-182866128" Tag="143" RotationSkewX="0" RotationSkewY="0" LeftMargin="10" RightMargin="10" TopMargin="3" BottomMargin="3" FontSize="28" LabelText="+" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="36" X="22" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="21" Y="21" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="20" G="90" R="196" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_redu" ActionTag="-1805630100" Tag="144" RotationSkewX="0" RotationSkewY="0" LeftMargin="216.000504" RightMargin="461.999512" TopMargin="363.01001" BottomMargin="874.98999" TouchEnable="True" LeftEage="11" RightEage="11" TopEage="21" BottomEage="21" Scale9OriginX="11" Scale9OriginY="21" Scale9Width="20" Scale9Height="1" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="42" X="42" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="237.000504" Y="895.98999" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1015_1.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="Text_1" Visible="False" ActionTag="-701918850" Tag="145" RotationSkewX="0" RotationSkewY="0" LeftMargin="5.5" RightMargin="5.5" TopMargin="3" BottomMargin="3" FontSize="28" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="36" X="31" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="21" Y="21" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="20" G="90" R="196" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_3" ActionTag="1865478795" Tag="45" RotationSkewX="0" RotationSkewY="0" LeftMargin="291.027191" RightMargin="305.972809" TopMargin="368.100006" BottomMargin="877.900024" LeftEage="10" RightEage="10" TopEage="6" BottomEage="6" Scale9OriginX="10" Scale9OriginY="6" Scale9Width="2" Scale9Height="5" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="34" X="123" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="352.527191" Y="894.900024" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_90005.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="composite_num" ActionTag="-409084620" Tag="146" RotationSkewX="0" RotationSkewY="0" LeftMargin="55" RightMargin="55" TopMargin="1.5" BottomMargin="1.5" FontSize="24" LabelText="1" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="31" X="13" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="61.5" Y="17" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="20" G="90" R="196" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="gold_bg" ActionTag="8062653" Tag="147" RotationSkewX="0" RotationSkewY="0" LeftMargin="293.442902" RightMargin="303.557098" TopMargin="421.690002" BottomMargin="824.309998" LeftEage="10" RightEage="10" TopEage="6" BottomEage="6" Scale9OriginX="10" Scale9OriginY="6" Scale9Width="2" Scale9Height="5" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="34" X="123" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="293.442902" Y="841.309998" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_90005.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="gold_num" ActionTag="-212291807" Tag="148" RotationSkewX="0" RotationSkewY="0" LeftMargin="321.000702" RightMargin="385.999298" TopMargin="422.51001" BottomMargin="826.48999" FontSize="24" LabelText="1" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="31" X="13" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="321.000702" Y="841.98999" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="20" G="90" R="196" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="spriteGold" ActionTag="466886903" Tag="149" RotationSkewX="0" RotationSkewY="0" LeftMargin="237.866302" RightMargin="377.133698" TopMargin="387.73999" BottomMargin="787.26001" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="105" X="105" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="290.366302" Y="839.76001" />
                    <Scale ScaleX="0.4" ScaleY="0.4" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Normal" Path="resource/item/1.png" Plist="" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="text_Field" ActionTag="-1453069496" Tag="68" RotationSkewX="0" RotationSkewY="0" LeftMargin="291" RightMargin="305" TopMargin="369" BottomMargin="879" TouchEnable="True" FontSize="24" IsCustomSize="True" PlaceHolderText="输入数量" MaxLengthText="10" PasswordEnable="False" LabelText="" ctype="TextFieldObjectData">
                    <Size Y="32" X="124" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="353" Y="895" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="artifact_container" Visible="False" ActionTag="-772172433" Tag="78" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="1280" X="720" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="0" Y="0" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="tab_container" ActionTag="-1175211510" Tag="145" RotationSkewX="0" RotationSkewY="0" LeftMargin="200" RightMargin="200" TopMargin="1058.570068" BottomMargin="160.429993" BackColorAlpha="102" Scale9Enable="True" LeftEage="-21" RightEage="-21" TopEage="-16" BottomEage="-16" Scale9OriginX="-21" Scale9OriginY="-16" Scale9Width="42" Scale9Height="32" ctype="PanelObjectData">
                <Size Y="61" X="320" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="190.929993" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="tab_btn_1" ActionTag="-181826163" Tag="146" RotationSkewX="0" RotationSkewY="0" LeftMargin="5.16" RightMargin="156.839996" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="61" X="158" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="84.160004" Y="30.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="unselect_bg" ActionTag="-1411962559" Tag="147" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="25" Scale9OriginY="25" Scale9Width="2" Scale9Height="11" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="61" X="158" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="79" Y="30.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="common_2026.png" Plist="resource/common/common.plist" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="select_bg" ActionTag="-1637882652" Tag="148" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="25" Scale9OriginY="25" Scale9Width="2" Scale9Height="11" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="61" X="158" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="79" Y="30.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="common_2027.png" Plist="resource/common/common.plist" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="title" ActionTag="-45857742" Tag="149" RotationSkewX="0" RotationSkewY="0" LeftMargin="72.246597" RightMargin="58.753399" TopMargin="13" BottomMargin="13" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="35" X="27" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="85.746597" Y="30.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="118" G="239" R="248" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="5" G="39" R="92" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="tips" Visible="False" ActionTag="-652304226" Tag="96" RotationSkewX="0" RotationSkewY="0" LeftMargin="117.475502" RightMargin="15.5245" TopMargin="-3.1197" BottomMargin="39.119701" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="25" X="25" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="129.975494" Y="51.619701" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="mainui_1009.png" Plist="resource/mainui/mainui.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="tab_btn_2" ActionTag="1243903487" Tag="150" RotationSkewX="0" RotationSkewY="0" LeftMargin="156.839996" RightMargin="5.16" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="61" X="158" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="235.839996" Y="30.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="unselect_bg" ActionTag="-2069633255" Tag="151" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="25" Scale9OriginY="25" Scale9Width="2" Scale9Height="11" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="61" X="158" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="79" Y="30.5" />
                        <Scale ScaleX="-1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="common_2026.png" Plist="resource/common/common.plist" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="select_bg" ActionTag="1273423071" Tag="152" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="25" Scale9OriginY="25" Scale9Width="2" Scale9Height="11" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="61" X="158" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="79" Y="30.5" />
                        <Scale ScaleX="-1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="common_2027.png" Plist="resource/common/common.plist" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="title" ActionTag="1452858759" Tag="153" RotationSkewX="0" RotationSkewY="0" LeftMargin="60.365002" RightMargin="70.635002" TopMargin="14.0736" BottomMargin="11.9264" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="35" X="27" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="73.864998" Y="29.426399" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="118" G="239" R="248" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="5" G="39" R="92" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="tips" Visible="False" ActionTag="-1831658686" Tag="99" RotationSkewX="0" RotationSkewY="0" LeftMargin="105.819298" RightMargin="27.1807" TopMargin="-5.6739" BottomMargin="41.673901" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="25" X="25" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="118.319298" Y="54.173901" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="mainui_1009.png" Plist="resource/mainui/mainui.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="btn_return" ActionTag="-1156778344" Tag="29" RotationSkewX="0" RotationSkewY="0" LeftMargin="563.5" RightMargin="3.5" TopMargin="1094.5" BottomMargin="104.5" TouchEnable="True" LeftEage="20" RightEage="20" TopEage="23" BottomEage="23" Scale9OriginX="20" Scale9OriginY="23" Scale9Width="121" Scale9Height="41" ctype="ImageViewObjectData">
                <Size Y="81" X="153" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="640" Y="145" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="txt_cn_common_1107.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
