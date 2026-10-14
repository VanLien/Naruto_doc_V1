<GameFile>
  <PropertyGroup Name="arena_champion_top_3_window" Type="Layer" ID="wl-qf2mk94rotaip0g63xj5zn7su8b1dhvey" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="15" Speed="1.000000">
        <Timeline ActionTag="252639087" Property="Position">
          <PointFrame FrameIndex="0" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="7" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="12" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="15" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="252639087" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.000000" Y="0.100000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="7" X="1.000000" Y="1.200000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="12" X="1.000000" Y="0.900000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="15" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="252639087" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="7" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="12" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="15" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="252639087" Property="FrameEvent">
          <EventFrame FrameIndex="15" Value="start_frame">
          </EventFrame>
        </Timeline>
        <Timeline ActionTag="252639087" Property="Alpha">
          <IntFrame FrameIndex="0" Value="0">
            <EasingData Type="0" />
          </IntFrame>
          <IntFrame FrameIndex="7" Value="247">
            <EasingData Type="0" />
          </IntFrame>
        </Timeline>
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="2090117295" Tag="26" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="128" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
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
          <AbstractNodeData Name="main_container" ActionTag="252639087" Tag="16" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="407" BottomMargin="407" Alpha="0" ComboBoxIndex="1" BackColorAlpha="126" Scale9Enable="True" LeftEage="-18" RightEage="-18" TopEage="-18" BottomEage="-18" Scale9OriginX="-18" Scale9OriginY="-18" Scale9Width="36" Scale9Height="36" ctype="PanelObjectData">
            <Size Y="466" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="0.1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
            <Children>
              <AbstractNodeData Name="Sprite_1" ActionTag="-1335096714" Tag="17" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="0" BottomMargin="420" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="1" />
                <Position X="360" Y="466" />
                <Scale ScaleX="2.62" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_2" ActionTag="-1756700765" Tag="18" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="420" BottomMargin="0" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="0" />
                <Scale ScaleX="2.62" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_3" ActionTag="-1838748456" Tag="19" RotationSkewX="0" RotationSkewY="0" LeftMargin="11.992" RightMargin="356.007996" TopMargin="456.500305" BottomMargin="-19.500299" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="29" X="352" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="187.992004" Y="-5.0003" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_30003.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_4" ActionTag="905562024" Tag="20" RotationSkewX="0" RotationSkewY="0" LeftMargin="364.000092" RightMargin="3.9999" TopMargin="456.5" BottomMargin="-19.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="29" X="352" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="540.000122" Y="-5" />
                <Scale ScaleX="-1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_30003.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_5" ActionTag="-1080626973" Tag="21" RotationSkewX="0" RotationSkewY="0" LeftMargin="536.987976" RightMargin="0.012" TopMargin="-25.999701" BottomMargin="461.999695" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="30" X="183" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="628.487976" Y="476.999695" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_30002.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_6" ActionTag="1387454068" Tag="22" RotationSkewX="0" RotationSkewY="0" LeftMargin="-182.999893" RightMargin="719.999878" TopMargin="-25.999701" BottomMargin="461.999695" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="30" X="183" />
                <AnchorPoint ScaleX="1" ScaleY="0.5" />
                <Position X="0.0001" Y="476.999695" />
                <Scale ScaleX="-1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_30002.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_14" ActionTag="-1053561119" Tag="29" RotationSkewX="0" RotationSkewY="0" LeftMargin="245" RightMargin="245" TopMargin="44.5" BottomMargin="98.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="323" X="230" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="260" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="txt_cn_arenatop_101.png" Plist="resource/arena/arenachampiontop3.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_15" ActionTag="-450655896" Tag="30" RotationSkewX="0" RotationSkewY="0" LeftMargin="6" RightMargin="484" TopMargin="89.499802" BottomMargin="53.500198" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="323" X="230" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="121" Y="215.000198" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="txt_cn_arenatop_102.png" Plist="resource/arena/arenachampiontop3.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_16" ActionTag="425651204" Tag="31" RotationSkewX="0" RotationSkewY="0" LeftMargin="484" RightMargin="6" TopMargin="89.5" BottomMargin="53.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="323" X="230" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="599" Y="215" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="txt_cn_arenatop_103.png" Plist="resource/arena/arenachampiontop3.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="title_container" ActionTag="1272006746" Tag="15" RotationSkewX="0" RotationSkewY="0" LeftMargin="260" RightMargin="260" TopMargin="-30" BottomMargin="456" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="40" X="200" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="456" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="Sprite_13" ActionTag="946470042" Tag="28" RotationSkewX="0" RotationSkewY="0" LeftMargin="-67.5" RightMargin="-67.5" TopMargin="-22.5" BottomMargin="-62.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="125" X="335" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="txt_cn_arenatop_100.png" Plist="resource/arena/arenachampiontop3.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="role_name_2" ActionTag="964705247" Tag="32" RotationSkewX="0" RotationSkewY="0" LeftMargin="69.5" RightMargin="547.5" TopMargin="329" BottomMargin="115" FontSize="20" LabelText="Text Label" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="22" X="103" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="121" Y="126" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="role_name_1" ActionTag="1267952977" Tag="33" RotationSkewX="0" RotationSkewY="0" LeftMargin="308.5" RightMargin="308.5" TopMargin="282" BottomMargin="162" FontSize="20" LabelText="Text Label" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="22" X="103" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="173" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="role_name_3" ActionTag="258739864" Tag="34" RotationSkewX="0" RotationSkewY="0" LeftMargin="547.5" RightMargin="69.5" TopMargin="329" BottomMargin="115" FontSize="20" LabelText="Text Label" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="22" X="103" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="599" Y="126" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="match_time" ActionTag="-342654947" Tag="18" RotationSkewX="0" RotationSkewY="0" LeftMargin="268.5" RightMargin="268.5" TopMargin="424" BottomMargin="20" FontSize="20" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="22" X="183" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="31" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="20" G="255" R="53" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
