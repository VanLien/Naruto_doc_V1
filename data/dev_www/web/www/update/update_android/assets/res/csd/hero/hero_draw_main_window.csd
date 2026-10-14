<GameFile>
  <PropertyGroup Name="hero_draw_main_window" Type="Layer" ID="slhteqp-d0c2b759xgmvir4znk63ayjwou1f" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="5510229" Tag="122" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="-1228368892" Tag="78" RotationSkewX="0" RotationSkewY="0" LeftMargin="0.7099" RightMargin="-0.7099" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="75" Scale9Enable="True" LeftEage="-14" RightEage="-14" TopEage="-39" BottomEage="-39" Scale9OriginX="-14" Scale9OriginY="-39" Scale9Width="28" Scale9Height="78" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360.7099" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
            <Children>
              <AbstractNodeData Name="centre_panel" ActionTag="2017874867" Tag="298" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="75" Scale9Enable="True" LeftEage="-14" RightEage="-14" TopEage="-39" BottomEage="-39" Scale9OriginX="-14" Scale9OriginY="-39" Scale9Width="28" Scale9Height="78" ctype="PanelObjectData">
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
                <Children>
                  <AbstractNodeData Name="hero_draw_icon" ActionTag="839445455" Tag="297" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="617" BottomMargin="617" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="46" X="46" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="360" Y="640" />
                    <Scale ScaleX="0.934" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="add_btn" ActionTag="1657540131" Tag="287" RotationSkewX="0" RotationSkewY="0" LeftMargin="658" RightMargin="12" TopMargin="275" BottomMargin="965" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="40" X="50" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="683" Y="985" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="img" ActionTag="-2117585069" Tag="288" RotationSkewX="0" RotationSkewY="0" LeftMargin="12" RightMargin="12" TopMargin="6.5" BottomMargin="6.5" LeftEage="5" RightEage="5" TopEage="2" BottomEage="2" Scale9OriginX="5" Scale9OriginY="2" Scale9Width="16" Scale9Height="23" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="27" X="26" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="25" Y="20" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_02.png" Plist="resource/herodraw/herodraw.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="delete_btn" ActionTag="1659978376" Tag="289" RotationSkewX="0" RotationSkewY="0" LeftMargin="658" RightMargin="12" TopMargin="796" BottomMargin="444" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="40" X="50" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="683" Y="464" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="img" ActionTag="-854629391" Tag="290" RotationSkewX="0" RotationSkewY="0" LeftMargin="17" RightMargin="17" TopMargin="15.5" BottomMargin="15.5" LeftEage="5" RightEage="5" TopEage="2" BottomEage="2" Scale9OriginX="5" Scale9OriginY="2" Scale9Width="6" Scale9Height="5" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="9" X="16" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="25" Y="20" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_01.png" Plist="resource/herodraw/herodraw.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="slider" ActionTag="1714616898" Tag="291" RotationSkewX="-90" RotationSkewY="-90" LeftMargin="444.808197" RightMargin="-202.808197" TopMargin="550.227173" BottomMargin="717.772827" TouchEnable="True" Alpha="249" ProgressInfo="3" ctype="SliderObjectData">
                    <Size Y="12" X="478" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="683.808228" Y="723.772827" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <BackGroundData Type="PlistSubImage" Path="hero_draw_04.png" Plist="resource/herodraw/herodraw.plist" />
                    <ProgressBarData />
                    <BallNormalData Type="PlistSubImage" Path="hero_draw_05.png" Plist="resource/herodraw/herodraw.plist" />
                    <BallPressedData Type="Default" Path="Default/SliderNode_Press.png" Plist="" />
                    <BallDisabledData Type="Default" Path="Default/SliderNode_Disable.png" Plist="" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="top_panel" ActionTag="1924959848" Tag="292" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="1208.665527" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="71.334503" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="1" />
                <Position X="360" Y="1280" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="hero_name_bg" ActionTag="1123442696" Tag="293" RotationSkewX="0" RotationSkewY="0" LeftMargin="183.992905" RightMargin="185.007095" TopMargin="40.871899" BottomMargin="-11.5374" LeftEage="45" RightEage="45" TopEage="0" BottomEage="0" Scale9OriginX="45" Scale9OriginY="0" Scale9Width="1" Scale9Height="42" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="42" X="351" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="359.492889" Y="9.4626" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hero_draw_08.png" Plist="resource/herodraw/herodraw.plist" />
                    <Children>
                      <AbstractNodeData Name="title_bg" ActionTag="1313117645" Tag="294" RotationSkewX="0" RotationSkewY="0" LeftMargin="157.5" RightMargin="157.5" TopMargin="50.377399" BottomMargin="-43.377399" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="35" X="36" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="175.5" Y="-25.877399" />
                        <Scale ScaleX="6.9635" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_09.png" Plist="resource/herodraw/herodraw.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="hero_name" ActionTag="-765408161" Tag="295" RotationSkewX="0" RotationSkewY="0" LeftMargin="67" RightMargin="67" TopMargin="1.5" BottomMargin="1.5" FontSize="36" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="39" X="217" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="175.5" Y="21" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="190" G="234" R="252" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="title_name" ActionTag="-358477193" Tag="296" RotationSkewX="0" RotationSkewY="0" LeftMargin="91.340302" RightMargin="101.659698" TopMargin="55.818001" BottomMargin="-41.818001" FontSize="26" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="28" X="158" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="170.340302" Y="-27.818001" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="78" G="95" R="121" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="hide_btn" ActionTag="1734385331" Tag="299" RotationSkewX="0" RotationSkewY="0" LeftMargin="10.0078" RightMargin="629.992188" TopMargin="145.713699" BottomMargin="-144.379196" TouchEnable="True" BackColorAlpha="102" LeftEage="-17" RightEage="-17" TopEage="-18" BottomEage="-18" Scale9OriginX="-17" Scale9OriginY="-18" Scale9Width="34" Scale9Height="36" ctype="PanelObjectData">
                    <Size Y="70" X="80" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="50.007801" Y="-109.379204" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="img" ActionTag="-1076815859" Tag="300" RotationSkewX="0" RotationSkewY="0" LeftMargin="13" RightMargin="13" TopMargin="7.5" BottomMargin="7.5" LeftEage="5" RightEage="5" TopEage="2" BottomEage="2" Scale9OriginX="5" Scale9OriginY="2" Scale9Width="44" Scale9Height="51" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="55" X="54" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="40" Y="35" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_17.png" Plist="resource/herodraw/herodraw.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="share_btn" ActionTag="2016672114" Tag="301" RotationSkewX="0" RotationSkewY="0" LeftMargin="9.6232" RightMargin="630.37677" TopMargin="70.740601" BottomMargin="-69.406097" TouchEnable="True" BackColorAlpha="102" LeftEage="-17" RightEage="-17" TopEage="-18" BottomEage="-18" Scale9OriginX="-17" Scale9OriginY="-18" Scale9Width="34" Scale9Height="36" ctype="PanelObjectData">
                    <Size Y="70" X="80" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="49.623199" Y="-34.406101" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="img" ActionTag="947641813" Tag="302" RotationSkewX="0" RotationSkewY="0" LeftMargin="13" RightMargin="13" TopMargin="7.5" BottomMargin="7.5" LeftEage="5" RightEage="5" TopEage="2" BottomEage="2" Scale9OriginX="5" Scale9OriginY="2" Scale9Width="44" Scale9Height="51" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="55" X="54" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="40" Y="35" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_16.png" Plist="resource/herodraw/herodraw.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="bottom_panel" ActionTag="-1913300985" Tag="178" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="1167" BottomMargin="0" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="113" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="0" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="bottom_bg" ActionTag="-1889850514" Tag="235" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="-9.7098" BottomMargin="76.709801" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="46" X="46" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="360" Y="99.709801" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="bg" ActionTag="713672774" Tag="234" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="38.235802" BottomMargin="0" LeftEage="3" RightEage="3" TopEage="26" BottomEage="26" Scale9OriginX="3" Scale9OriginY="26" Scale9Width="6" Scale9Height="28" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="74.764198" X="720" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="360" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hero_draw_20.png" Plist="resource/herodraw/herodraw.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="tab_btn_1" ActionTag="421110816" Tag="200" RotationSkewX="0" RotationSkewY="0" LeftMargin="143.5" RightMargin="377.5" TopMargin="16" BottomMargin="3" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="94" X="199" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="243" Y="50" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="normal_img" ActionTag="1757478363" Tag="201" RotationSkewX="0" RotationSkewY="0" LeftMargin="0.5" RightMargin="0.5" TopMargin="11.1342" BottomMargin="1.8658" LeftEage="9" RightEage="9" TopEage="10" BottomEage="10" Scale9OriginX="9" Scale9OriginY="10" Scale9Width="180" Scale9Height="71" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="81" X="198" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="99.5" Y="42.365799" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_23.png" Plist="resource/herodraw/herodraw.plist" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="select_img" Visible="False" ActionTag="1343389421" Tag="203" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="11" RightEage="11" TopEage="12" BottomEage="12" Scale9OriginX="11" Scale9OriginY="12" Scale9Width="177" Scale9Height="77" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="94" X="199" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="99.5" Y="47" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_24.png" Plist="resource/herodraw/herodraw.plist" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="label" ActionTag="-668345101" Tag="205" RotationSkewX="0" RotationSkewY="0" LeftMargin="74" RightMargin="74" TopMargin="26.1322" BottomMargin="41.867802" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="26" X="51" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="99.5" Y="54.867802" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="101" G="133" R="175" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="255" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="tab_btn_2" ActionTag="-373529317" Tag="240" RotationSkewX="0" RotationSkewY="0" LeftMargin="380.5" RightMargin="140.5" TopMargin="16" BottomMargin="3" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="94" X="199" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="480" Y="50" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="normal_img" ActionTag="-2089943709" Tag="241" RotationSkewX="0" RotationSkewY="0" LeftMargin="0.5" RightMargin="0.5" TopMargin="11.1342" BottomMargin="1.8658" LeftEage="9" RightEage="9" TopEage="10" BottomEage="10" Scale9OriginX="9" Scale9OriginY="10" Scale9Width="180" Scale9Height="71" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="81" X="198" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="99.5" Y="42.365799" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_23.png" Plist="resource/herodraw/herodraw.plist" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="select_img" Visible="False" ActionTag="-317437637" Tag="242" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="11" RightEage="11" TopEage="12" BottomEage="12" Scale9OriginX="11" Scale9OriginY="12" Scale9Width="177" Scale9Height="77" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="94" X="199" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="99.5" Y="47" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_24.png" Plist="resource/herodraw/herodraw.plist" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="label" ActionTag="532841335" Tag="243" RotationSkewX="0" RotationSkewY="0" LeftMargin="74" RightMargin="74" TopMargin="26.1322" BottomMargin="41.867802" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="26" X="51" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="99.5" Y="54.867802" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="101" G="133" R="175" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="255" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="close_btn" ActionTag="941031922" Tag="262" RotationSkewX="0" RotationSkewY="0" LeftMargin="-0.69" RightMargin="644.690002" TopMargin="38.162701" BottomMargin="-1.1627" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="23" BottomEage="23" Scale9OriginX="17" Scale9OriginY="23" Scale9Width="42" Scale9Height="30" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="76" X="76" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="37.310001" Y="36.837299" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hero_draw_21.png" Plist="resource/herodraw/herodraw.plist" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="container" ActionTag="-1907457192" Tag="268" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="75" Scale9Enable="True" LeftEage="-14" RightEage="-14" TopEage="-39" BottomEage="-39" Scale9OriginX="-14" Scale9OriginY="-39" Scale9Width="28" Scale9Height="78" ctype="PanelObjectData">
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
              <AbstractNodeData Name="shard_handle_panel" Visible="False" ActionTag="-897284649" Tag="428" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="1280" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="640" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="bottom_panel" ActionTag="1969310179" Tag="360" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="1167" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="113" X="720" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="360" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="confirm_btn" ActionTag="1262660082" Tag="429" RotationSkewX="0" RotationSkewY="0" LeftMargin="447" RightMargin="87" TopMargin="1208" BottomMargin="10" TouchEnable="True" LeftEage="8" RightEage="8" TopEage="20" BottomEage="20" Scale9OriginX="8" Scale9OriginY="20" Scale9Width="170" Scale9Height="22" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="62" X="186" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="540" Y="41" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="txt_cn_hero_draw_02.png" Plist="resource/herodraw/herodraw.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="cancel_btn" ActionTag="-2059615653" Tag="430" RotationSkewX="0" RotationSkewY="0" LeftMargin="88" RightMargin="446" TopMargin="1208" BottomMargin="10" TouchEnable="True" LeftEage="8" RightEage="8" TopEage="20" BottomEage="20" Scale9OriginX="8" Scale9OriginY="20" Scale9Width="170" Scale9Height="22" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="62" X="186" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="181" Y="41" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="txt_cn_hero_draw_03.png" Plist="resource/herodraw/herodraw.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="erweima_container" ActionTag="1591780410" Tag="431" RotationSkewX="0" RotationSkewY="0" LeftMargin="561.000427" RightMargin="18.999599" TopMargin="1014.999878" BottomMargin="125.000099" TouchEnable="True" ComboBoxIndex="1" Scale9Enable="True" LeftEage="8" RightEage="8" TopEage="7" BottomEage="7" Scale9OriginX="8" Scale9OriginY="7" Scale9Width="9" Scale9Height="8" ctype="PanelObjectData">
                    <Size Y="140" X="140" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="631.000427" Y="125.000099" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hero_draw_06.png" Plist="resource/herodraw/herodraw.plist" />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="255" R="255" />
                    <Children>
                      <AbstractNodeData Name="img" ActionTag="2082825938" Tag="432" RotationSkewX="0" RotationSkewY="0" LeftMargin="47" RightMargin="47" TopMargin="47" BottomMargin="47" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="70" Y="70" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="logo_container" ActionTag="-810686961" Tag="433" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="477" TopMargin="0" BottomMargin="1125" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="155" X="243" />
                    <AnchorPoint ScaleX="0" ScaleY="1" />
                    <Position X="0" Y="1280" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="logo_img" ActionTag="551608211" Tag="434" RotationSkewX="0" RotationSkewY="0" LeftMargin="13.0005" RightMargin="183.999496" TopMargin="0" BottomMargin="109" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0" ScaleY="1" />
                        <Position X="13.0005" Y="155" />
                        <Scale ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Sprite_1" ActionTag="-2005321743" Tag="435" RotationSkewX="0" RotationSkewY="0" LeftMargin="106.5" RightMargin="106.5" TopMargin="140.5" BottomMargin="-14.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="29" X="30" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="121.5" Y="0" />
                        <Scale ScaleX="7.2" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_07.png" Plist="resource/herodraw/herodraw.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="label" ActionTag="1364262240" Tag="436" RotationSkewX="0" RotationSkewY="0" LeftMargin="10" RightMargin="10" TopMargin="144" BottomMargin="-11" FontSize="20" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="22" X="223" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="121.5" Y="0" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="21" G="49" R="77" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
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
